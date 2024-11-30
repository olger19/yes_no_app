import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    //Alinea los textos a lado derecho
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Puedo crear esta burbuja como un widget independiente
        Container(
          //Bordeado de la listaView de los elementos
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

         //Insertando imagenes en una clase independiente
        _ImageBubble( message.imageUrl! ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble( this.imageUrl );

  @override
  Widget build(BuildContext context) {

    //MediaQuery informacion del dispositivo que lo esta ejecutando
    //Context referencia al arbol de widgets y toda la informacion de dimensiones de dispositivos
    final size = MediaQuery.of(context).size;//me da la dimensiones del dispositivo

    //Permitir border redondeados
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 150,
          //Basado en la dimensiones que les estoy dando, coloca ahi la imagen
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            //Retorna la imagen gif
            if (loadingProgress == null) return child;
            //Si no, retorna  el mensaje de enviando un mensaje
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Mi amor está enviando una imagen'),
            );
          },
        ));
  }
}