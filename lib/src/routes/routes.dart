import 'package:flutter/material.dart';

import 'package:psycare/src/pages/home_page.dart';
import 'package:psycare/src/pages/preferences_page.dart';
import 'package:psycare/src/pages/profile_page.dart';
import 'package:psycare/src/pages/sensors_page.dart'; 


  Map <String, WidgetBuilder> getApplicationRoutes(){
    return <String, WidgetBuilder> {
          HomePage.routeName        : ( BuildContext context ) => HomePage(),
          SensorsPage.routeName     : ( BuildContext context ) => SensorsPage(),
          ProfilePage.routeName     : ( BuildContext context ) => ProfilePage(), 
          PreferencesPage.routeName : ( BuildContext context ) => PreferencesPage(), 
  };
}