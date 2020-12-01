import 'package:ufrb_eventos/app/modules/user_commands/domain/repositories/user_commands_repository.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/usecases/create_summary.dart';
import 'package:ufrb_eventos/app/modules/user_commands/external/datasouces/user_command_datasources.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/datasources/user_commands_datasource.dart';
import 'infra/repositories/user_command_repository.dart';
import 'presenter/createSummary/create_summary_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserCommandsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CreateSummaryController(i())),
        Bind<ICreateSummary>((i) => CreateSummary(i())),
        Bind<IUserCommandsRepository>((i) => UserCommandsRepository(i())),
        Bind<IUserCommandsDatasource>((i) => UserCommandDatasource(i())),
        
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<UserCommandsModule>.of();
}
