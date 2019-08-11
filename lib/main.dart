import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:psycare/src/pages/home_page.dart';
import 'package:psycare/src/providers/push_notification_provider.dart';
import 'package:psycare/src/routes/routes.dart';
import 'package:psycare/src/shared_prefs/preferences_user.dart'; 
 
void main() async{
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
    runApp(MyApp());
  }
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'MX'), // Español
      ],
      title: 'Psycare',
      initialRoute: HomePage.routeName,
      routes: getApplicationRoutes(),
    );
  }
}