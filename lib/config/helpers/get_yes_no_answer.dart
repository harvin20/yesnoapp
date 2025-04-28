import 'package:dio/dio.dart';
import 'package:yesnoapp/domain/entities/message.dart';
import 'package:yesnoapp/infrastructure/model/yes_no_model.dart';
 // Asegúrate de importar tu modelo

class GetYesNoAnswer {
  final Dio _dio = Dio(); // Corrección 1: Tipo Dio y nombre correcto

  Future<Message> getAnswer() async { // Corrección 2: Llaves bien colocadas
    try {
      final response = await _dio.get('https://yesno.wtf/api');
      
      // Corrección 3: Usa fromJson en lugar de fromJsonMap
      final yesNoModel = YesNoModel.fromJson(response.data); 
      
      // Corrección 4: Nombre correcto del método
      return yesNoModel.toMessageEntity(); 
    } catch (e) {
      throw Exception('Error fetching answer: $e');
    }
  }
}