import 'package:flutter/material.dart';
import 'package:psycare/src/shared_prefs/preferences_user.dart';
import 'package:psycare/src/widgets/menu_widget.dart';

class ProfilePage extends StatefulWidget {

  static final String routeName = 'profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  
  int _genero;
  TextEditingController _inputFieldDateController;
  TextEditingController _inputFieldNameController;
  TextEditingController _inputFieldLastNameController;
  TextEditingController _inputFieldEmailController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() { 
    super.initState();
    _genero = prefs.genero;
    _inputFieldNameController = new TextEditingController(text: prefs.nombre);
    _inputFieldLastNameController = new TextEditingController(text: prefs.apellido);
    _inputFieldEmailController = new TextEditingController(text: prefs.email);
    _inputFieldDateController = new TextEditingController(text: prefs.fecha);
  }


  _setNombre(String valor) {
    prefs.nombre = valor;
    setState(() {});
  }
  _setApellido(String valor) {
    prefs.apellido = valor;
    setState(() {});
  }
  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }
  _setFecha(DateTime valor) {
    prefs.fecha = valor.toString();
    _inputFieldDateController.text = valor.toString();
    setState(() {});
  }
  _setEmail(String valor) {
    prefs.email = valor;
    _inputFieldEmailController.text = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.purple : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0) ,
            child: Center(
              child: Text('Datos Personales' , style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: (prefs.colorSecundario) ? Colors.purple : Colors.blue),),
            ),
          ),

          Divider(),
      //Campos para nombre y apellido //////////////////////
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              textCapitalization: TextCapitalization.words,
              controller: _inputFieldNameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Primer Nombre',
                suffixIcon: Icon(Icons.person),
                icon: Icon(Icons.account_circle),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
                ),
              onChanged: _setNombre
            ),
          ),

          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              textCapitalization: TextCapitalization.words,
              controller: _inputFieldLastNameController,
              decoration: InputDecoration(
                labelText: 'Apellido',
                helperText: 'Primer Apellido',
                suffixIcon: Icon(Icons.person),
                icon: Icon(Icons.account_circle),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
                ),
              onChanged: _setApellido
            ),
          ),
      ///////////////////////////////////////////////
          Divider(),

      // Campo para fecha de nacimiento ////////////

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _inputFieldDateController,
              enableInteractiveSelection: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Fecha de Nacimiento',
                helperText: 'Fecha de Nacimiento',
                suffixIcon: Icon(Icons.date_range),
                icon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
                ),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _selectDate(context);
              },
            ),
          ),

      //////////////////////////////////////////////////

          Divider(),

      //Radios para género ////////////////////////
          Container(
            child: RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio 
            ),
          ),

          Container(
            child: RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio
            ),
          ),
      /////////////////////////////////////////////////////////////
      
          Divider(),

      //Campo para Correo Electrónico //////////////////////
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _inputFieldEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                helperText: 'a@a.a',
                suffixIcon: Icon(Icons.alternate_email),
                icon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
                ),
              onChanged: _setEmail
            ),
          ),

        ],
      )
    );
  }


_selectDate(BuildContext context) async{
  DateTime picked = await showDatePicker(
    context: context,
    initialDate: new DateTime(1980),
    firstDate: new DateTime(1920),
    lastDate: new DateTime(2020),
    locale: Locale('es', 'MX'),
  );
  if ( picked != null ){
    _setFecha(picked);
  }

}
}