import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:noteee/configs/configs.dart' as theme;
import 'package:noteee/router/router.dart';
import 'package:noteee/router/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final List<NavigatorObserver> observers = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      navigatorObservers: [...observers, NavigationHistoryObserver()],
      theme: theme.themeLight,
      initialRoute: AppRoutes.onboarding,
      builder: (context, child) {
        theme.App.init(context);
        return child!;
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      routes: appRoutes,
    );
  }
}
