import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:praktik_dokter/bloc/login/login_bloc.dart';
import 'package:praktik_dokter/data/models/request/login_request_model.dart';
import 'package:praktik_dokter/pages/base_widgets/buttons/custom_button.dart';
import 'package:praktik_dokter/pages/base_widgets/textfield/custom_textfield_password.dart';
import 'package:praktik_dokter/pages/home/home_screen.dart';
import 'package:praktik_dokter/pages/main/main_screen.dart';
import 'package:praktik_dokter/theme.dart';

import '../../data/datasources/auth_local_datasource.dart';
import '../base_widgets/textfield/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState>? _formKeyLogin;

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _isDisabledBtn = false;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _emailController.addListener(_validateFields);
    _passwordController.addListener(_validateFields);
  }

  void _validateFields() async {
    final text1 = _emailController.text;
    final text2 = _passwordController.text;

    // Cek validasi di sini, misalnya, jika kedua TextField harus diisi.
    bool isValid = text1.isNotEmpty && text2.isNotEmpty;

    setState(() {
      _isDisabledBtn = isValid;
      print(_isDisabledBtn);
    });
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  void loginUser() async {
    if (_formKeyLogin!.currentState!.validate()) {
      _formKeyLogin!.currentState!.save();
      String email = _emailController!.text.trim();
      String password = _passwordController!.text.trim();

      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email'),
          backgroundColor: Colors.red,
        ));
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password'),
          backgroundColor: Colors.red,
        ));
      } else {
        final model = LoginRequestModel(email: email, password: password);
        context.read<LoginBloc>().add(LoginEvent.login(model));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 35,
                    height: 35,
                    child: Image.asset('assets/logo.png'),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Hi, Welcome Back',
                    style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w900, fontSize: 24),
                  ),
                  Text(
                    'Please sign in with your account',
                    style: secondaryTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKeyLogin,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            hintText: 'Enter your email',
                            focusNode: _emailFocus,
                            nextNode: _passwordFocus,
                            textInputType: TextInputType.emailAddress,
                            controller: _emailController,
                            icon: 'assets/email-icon.svg',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomPasswordTextField(
                            controller: _passwordController,
                            hintTxt: 'Enter your password',
                            focusNode: _passwordFocus,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                  loaded: (data) async {
                    // Save Token
                    await AuthLocalDatasource().saveAuthData(data);

                    // Push to Home
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return MainScreen();
                    }), (route) => false);
                  },
                );
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return CustomButton(
                        buttonText: 'Sign In',
                        isValid: _isDisabledBtn,
                        onTap: _isDisabledBtn ? loginUser : () {},
                      );
                    },
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
