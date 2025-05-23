import 'package:yesnoapp/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
  
//factory sirve para crear una nueva instancia de mi clase
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Message toMessageEntity() => Message(
    text: answer == 'quizá' ? 'Si' : 'No',
    fromWho: FromWho.hers,
    imageUrl: image,
  );
}