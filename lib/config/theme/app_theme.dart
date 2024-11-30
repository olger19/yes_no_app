import 'package:flutter/material.dart';

//Variables privadas usadas para este archivo
const Color _customColor = Color( 0xFF5C1104 ); //Color hexadecimal

//Lista personalizada de colores
const List<Color> _colorThemes = [

  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  ];


//Cambiar Los colores 
class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }):assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, 'Colors must be between 0 and ${_colorThemes.length}'); 

  //Metodo Retorna de tipo de ThemeData
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark //Theme oscuro
    );
  }
}