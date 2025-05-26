import 'package:yesnoapp/domain/entities/message.dart';
import 'dart:math';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
  
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Message toMessageEntity() {
    final random = Random();
    
    // Mapeo de respuestas posibles para cada caso
    Map<String, List<String>> responseOptions = {
      'yes': [
        '¡Sí!',
        'Por supuesto',
        'Desde luego',
        'Claro que sí',
        'Sin duda',
        'Afirmativo',
        '¡Por supuesto que sí!',
        'Sí, definitivamente'
      ],
      'no': [
        'No',
        'Para nada',
        'Negativo',
        'Nop',
        'No creo',
        'Ni lo sueñes',
        'Imposible',
        'De ninguna manera'
      ],
      'maybe': [
        'Quizás',
        'Tal vez',
        'No estoy seguro',
        'Puede ser',
        'Probablemente',
        'Habría que pensarlo',
        'No tengo una respuesta clara',
        '50/50'
      ],
    };

    // Convertir la respuesta a minúsculas para comparación
    String normalizedAnswer = answer.toLowerCase();

    // Seleccionar el grupo de respuestas basado en la respuesta original
    List<String>? possibleResponses;
    
    if (normalizedAnswer.contains('yes') || normalizedAnswer.contains('sí')) {
      possibleResponses = responseOptions['yes'];
    } else if (normalizedAnswer.contains('no')) {
      possibleResponses = responseOptions['no'];
    } else {
      possibleResponses = responseOptions['maybe'];
    }

    // Seleccionar una respuesta aleatoria del grupo correspondiente
    String finalResponse = possibleResponses![random.nextInt(possibleResponses.length)];

    return Message(
      text: finalResponse,
      fromWho: FromWho.hers,
      imageUrl: image,
    );
  }
}