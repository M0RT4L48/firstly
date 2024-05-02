import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{
  final _dio = Dio();
  //obtiene la respuesta
  Future<Message> getAnswer() async{
    //almacenar la peticion de tipo get en una variable
    final response = await _dio.get('https://yesno.wtf/api');

    //almacenar los datos de la respuesta en una variable
  final yesNoModel = YesNoModel.fromJson(response.data);

  return yesNoModel.toMessageEntity();
  }
}