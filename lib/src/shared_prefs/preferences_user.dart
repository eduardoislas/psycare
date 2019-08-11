import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instance = new PreferenciasUsuario._internal()  ;
  
  factory PreferenciasUsuario(){
    return _instance;
  }
 
  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    _prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }
  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get nombre{
    return _prefs.getString('nombre') ?? '';
  }
  set nombre(String value){
    _prefs.setString('nombre', value);
  }

  get apellido{
    return _prefs.getString('apellido') ?? '';
  }
  set apellido(String value){
    _prefs.setString('apellido', value);
  }

  get email{
    return _prefs.getString('email') ?? '';
  }
  set email(String value){
    _prefs.setString('email', value);
  }

  get fecha{
    return _prefs.getString('fecha') ?? '';
  }
  set fecha(String value){
    _prefs.setString('fecha', value);
  }

  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }
  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }
}