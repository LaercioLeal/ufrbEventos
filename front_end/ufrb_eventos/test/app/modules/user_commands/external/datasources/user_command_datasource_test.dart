import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/errors/errors.dart';
import 'package:ufrb_eventos/app/modules/user_commands/external/datasouces/user_command_datasources.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/model/summary_model.dart';

class DioMock extends Mock implements Dio {}

main() {
  var dio = DioMock();
  var datasource = UserCommandDatasource(dio);
  var summary = SummaryModel();

  test('Deve retornar um summary', () async {
    when(dio.post(any, options: anyNamed('options'), data: anyNamed('data')))
        .thenAnswer(
            (_) async => Response(data: summary.toJson(), statusCode: 200));
    var result =
        datasource.createSummary(summary);
    expect(result, completion(isA<SummaryModel>()));
  });

  test('Deve retornar um erro de usuario n encontrado', () async {
    when(dio.post(any, options: anyNamed('options'), data: anyNamed('data')))
        .thenThrow(DioError(response: Response(data: summary.toJson(), statusCode: 404,)));
    var result = datasource.createSummary(summary);
    expect(result, throwsA(isA<NotValidParams>()));
  });

  test('Deve retornar um erro de login invalido', () async {
    when(dio.post(any, options: anyNamed('options'), data: anyNamed('data')))
        ..thenThrow(DioError(response: Response(data: summary.toJson(), statusCode: 401,)));
    var result = datasource.createSummary(summary);
    expect(result, throwsA(isA<NotValidParams>()));
  });
}
