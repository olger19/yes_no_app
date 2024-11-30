//Presentation: Vistas del Aplicativo

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';


import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/236x/da/77/79/da77792e3c727b28c8665802c3228168.jpg?nii=t'),
          ),
        ),
        title: const Text('Mi amor'),
        centerTitle: false,
        //backgroundColor: ,
      ),
      //Extrayendo el Widget Container() como _ChatView() para organizar las pantallas
      body: _ChatView(),
    );
  }
}


//Cuerpo del ChatView 
class _ChatView extends StatelessWidget {
  //const _ChatView({
  //  super.key,
  //});
  @override
  Widget build(BuildContext context) {
    //hacer referencia de nuestro provider
    final chatProvider = context.watch<ChatProvider>(); //pendiendente de los cambios en esa instancia de la clase
    

    //Envolviendo la columna en un nuevo Widget SafeArea
    //Colocando el cuerpo en un area segura
    return SafeArea(
      //Envolviendo la columna en un padding  para separar un poco el horizontal
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //Expanded: Los text abarcen todo la pantalla
            //ListView.builder contruccion en tiempo de ejecucion
            //ListView lista de miles de elementos
            Expanded( child: ListView.builder(
              //Control de este scroll
              //Enlazados
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,//elementos
              itemBuilder: (context, index){ //como se va a construir
                //Esto regresa una instancia de mi Message que es mi entidad
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                ? HerMessageBubble(message: message)
                : MyMessageBubble(message: message);
              })),

            //Caja de texto
            MessageFieldBox(
              //onValue:(value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}