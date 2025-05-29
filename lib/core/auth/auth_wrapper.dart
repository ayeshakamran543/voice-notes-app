import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteee/router/routes.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          Future.microtask(() {
            if (snapshot.hasData) {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            } else {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            }
          });

          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
