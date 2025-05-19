import 'package:dio/dio.dart';
import 'package:yesnoapp/domain/entities/message.dart';
import 'package:yesnoapp/infrastructure/model/yes_no_model.dart';
 // Asegúrate de importar tu modelo

class GetYesNoAnswer {

  //instancia de la clase DIO para manejar peticiones HTTP
  final Dio _dio = Dio(); // Corrección 1: Tipo Dio y nombre correcto

  Future<Message> getAnswer() async { // Corrección 2: Llaves bien colocadas
  //Almacenar el resultado de la petición
    try {
      final response = await _dio.get('https://yesno.wtf/api');
      
      // Corrección 3: Usa fromJson en lugar de fromJsonMap
      
      //Almacenar la data de la respuesta
      final yesNoModel = YesNoModel.fromJsonMap(response.data); 
      
      // Corrección 4: Nombre correcto del método
      return yesNoModel.toMessageEntity(); 
      //generar un error si falla el servidor
    } catch (e) {
      throw Exception('Error fetching answer: $e');
    }
  }
}