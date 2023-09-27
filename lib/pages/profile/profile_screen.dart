import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktik_dokter/theme.dart';

import '../../bloc/logout/logout_bloc.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/bg-profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage('assets/image-doctor.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Dr Hendra',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        color: whiteColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Universitas Pendidikan Ganesha',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'drhendra@gmail.com',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: BlocConsumer<LogoutBloc, LogoutState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    loaded: (message) {
                      AuthLocalDatasource().removeAuthData();
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }), (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Logout Successfully'),
                        backgroundColor: Colors.green,
                      ));
                    },
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ));
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<LogoutBloc>()
                              .add(const LogoutEvent.logout());
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 22),
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Logout',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    loading: () {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 22),
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: whiteColor,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
