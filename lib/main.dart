import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktik_dokter/bloc/history/history_bloc.dart';
import 'package:praktik_dokter/bloc/login/login_bloc.dart';
import 'package:praktik_dokter/bloc/logout/logout_bloc.dart';
import 'package:praktik_dokter/bloc/pasien/pasien_bloc.dart';
import 'package:praktik_dokter/bloc/periksa/periksa_bloc.dart';
import 'package:praktik_dokter/data/datasources/auth_local_datasource.dart';
import 'package:praktik_dokter/pages/auth/login_screen.dart';
import 'package:praktik_dokter/pages/home/home_screen.dart';
import 'package:praktik_dokter/pages/main/main_screen.dart';
import 'package:praktik_dokter/pages/pasien/mobile/periksa_mobile_screen.dart';
import 'package:praktik_dokter/pages/pasien/periksa_screen.dart';
import 'package:praktik_dokter/pages/splash/splash_screen.dart';
import 'package:praktik_dokter/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(),
        ),
        BlocProvider(
          create: (context) => PasienBloc(),
        ),
        BlocProvider(
          create: (context) => PeriksaBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Praktik Dokter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                backgroundColor: backgroundColor,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData && snapshot.data!) {
              return MainScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
