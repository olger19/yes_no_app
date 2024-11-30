import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';


//Notificar cuando hay cambios, entonces modificar
class ChatProvider extends ChangeNotifier{

  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  //Tener control de un unico scroll
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola Amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];
  Future<void> sendMessage (String text) async{

    //Si el mensaje es vacio
    if(text.isEmpty) return;

    //Todo: Implementar metodo
    //Provider permite tener changes de manera global o a cierto nivel de nuestra aplicacion BluidContext
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    if(text.endsWith('?')){
      herReply();
    }

    //Si algo del provider cambio, Notifica a todos lo que esten escuchando, BuldContext
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{

    //Detallito para que el mensaje se procese y se vea mas bonito
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      //Posicion a la que agregar el mensaje
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
    
  }

}