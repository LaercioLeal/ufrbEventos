import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/errors/errors.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/datasources/user_commands_datasource.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/model/summary_model.dart';

class UserCommandDatasource implements IUserCommandsDatasource {
  final Dio dio;

  UserCommandDatasource(this.dio);
  @override
  Future<SummaryModel> createSummary(SummaryModel summaryModel) async {
    Response response;
    try {
      response = await dio.post('/summary',
          data: summaryModel.toMap(),
          options: Options(headers: {'Content-Type': 'application/json'}));
    } catch (e) {
      if (e.response.statusCode == 404) {
        throw NotValidParams('rota não encontrada');
      }
      if (e.response.statusCode == 401) {
        throw NotValidParams('não autorizado');
      }
      throw RequestError('erro ao fazer requisição ao servidor $e');
    }

    debugPrint(SummaryModel.fromJson(response.data).toJson().toString());
    return SummaryModel.fromJson(response.data);
  }
}
