import 'package:flutter/material.dart';
import 'package:psycare/src/shared_prefs/preferences_user.dart';
import 'package:psycare/src/widgets/menu_widget.dart';

class PreferencesPage extends StatefulWidget {

  static final String routeName = 'preferences';

  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {

  final prefs = new PreferenciasUsuario();
  bool _colorSecundario;

  @override
  void initState() {
    super.initState();
    _colorSecundario = prefs.colorSecundario;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.purple : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0) ,
            child: Center(
              child: Text('Ajustes', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: (prefs.colorSecundario) ? Colors.purple : Colors.blue),),
            ),
            ),

            Divider(),

            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value){
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              },
              )

        ],
      )
    );
  }
}