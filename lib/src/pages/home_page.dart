import 'package:flutter/material.dart';
import 'package:psycare/src/shared_prefs/preferences_user.dart';
import 'package:psycare/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = '/';

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psycare'),
        backgroundColor: (prefs.colorSecundario) ? Colors.purple : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Bienvenido ${prefs.nombre} ${prefs.apellido}"),
          Divider(),
          Text("Fecha de Nacimiento: ${prefs.fecha}"),
          Divider(),
          Text("Género: ${(prefs.genero)==1 ? 'Masculino' : 'Femenino'}"),
          Divider(),
          Text("Email: ${prefs.email}"),
          Divider(),
        ],
      ),
    );
  }
}