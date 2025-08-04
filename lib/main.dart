// import 'package:connect/contr0ller/newscontroller.dart';
import 'package:connect/pages/forget_pwd.dart';
import 'package:connect/pages/home.dart';
import 'package:connect/pages/landingpage.dart';
import 'package:connect/pages/login_screen.dart';
import 'package:connect/pages/new_password.dart';
import 'package:connect/pages/otp.dart';
import 'package:connect/pages/readarticle.dart';
import 'package:connect/pages/register.dart';
import 'package:connect/pages/welcomepage.dart';
// import 'package:connect/pages/camerapage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      color: Color.fromARGB(255, 226, 4, 4),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LandingPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/readarticle', page: () => Readarticle()),
        GetPage(name: '/welcome', page: () => WelcomePage()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/resetpwd', page: () => ForgetPasswordPage()),
        GetPage(name: '/otp', page: () => OtpValidation()),
        GetPage(name: '/newpassword', page: () => NewPasswordPage()),
        // GetPage(name: '/camera', page: () => Camerapage()),
      ],
    ),
  );
}
