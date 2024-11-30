import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //_: No me interesa ese argumento (context) no lo necesito
        //Provider global de nuestra aplicacion
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        //Personalizando los colores de manera de global
        theme: AppTheme( selectedColor: 1 ).theme(), //Metodo de la clase
        home: const ChatScreen()
      ),
    );
  }
}