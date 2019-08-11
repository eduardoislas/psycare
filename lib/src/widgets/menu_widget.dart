import 'package:flutter/material.dart';
import 'package:psycare/src/pages/home_page.dart';
import 'package:psycare/src/pages/preferences_page.dart';
import 'package:psycare/src/pages/profile_page.dart';
import 'package:psycare/src/pages/sensors_page.dart';
import 'package:psycare/src/shared_prefs/preferences_user.dart';

class MenuWidget extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Container(),
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/menu-img.jpg'),
              fit: BoxFit.cover
              )
             )
          ),
        ListTile(
          leading: Icon(Icons.home, color: (prefs.colorSecundario) ? Colors.purple : Colors.blue),
          title: Text('Inicio'),
          onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
        ),

        ListTile(
          leading: Icon(Icons.person, color: (prefs.colorSecundario) ? Colors.purple : Colors.blue),
          title: Text('Perfil'),
          onTap: () => Navigator.pushReplacementNamed(context, ProfilePage.routeName),
        ),

        ListTile(
          leading: Icon(Icons.swap_vertical_circle, color: (prefs.colorSecundario) ? Colors.purple : Colors.blue),
          title: Text('Sensores'),
          onTap: () => Navigator.pushReplacementNamed(context, SensorsPage.routeName),
        ),

        ListTile(
          leading: Icon(Icons.settings, color: (prefs.colorSecundario) ? Colors.purple : Colors.blue),
          title: Text('Preferencias'),
          onTap: () => Navigator.pushReplacementNamed(context, PreferencesPage.routeName),
        ),

      ],
      ),
  );
  }
}