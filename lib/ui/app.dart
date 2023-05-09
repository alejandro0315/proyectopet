import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypetapp/ui/auth/controlPets.dart';
import 'package:mypetapp/ui/auth/pets.dart';

import 'auth/home.dart';
import 'auth/login.dart';
import 'auth/register.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      initialRoute: '/login',
      routes: {
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/registroMascota": (context) => const Pets(),
        "/home": (context) => const Home(),
        "/controlPets": (context) => const ControlPets(),
      },
    );
  }
}
