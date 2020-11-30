import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/errors/errors.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/repositories/user_commands_repository.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/usecases/create_summary.dart';

class UserCommandRepositoryMock extends Mock
    implements IUserCommandsRepository {}

main() {
  final repository = UserCommandRepositoryMock();
  final usecase = CreateSummary(repository);

  test('deve retornar um summary', () async {
    when(repository.createSummary(any))
        .thenAnswer((_) async => Right(SummaryEntity()));
    final result = await usecase(SummaryEntity());
    expect(result.fold(id, id), isA<SummaryEntity>());
  });

  test('deve retornar um NotValidParams', () async {
    when(repository.createSummary(any)).thenAnswer((_) async => Right(SummaryEntity()));
    final result = await usecase(null);
    expect(result.fold(id, id), isA<NotValidParams>());
  });


}
