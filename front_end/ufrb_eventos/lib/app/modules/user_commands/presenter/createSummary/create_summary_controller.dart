import 'package:flutter/material.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/user_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/usecases/create_summary.dart';
import 'package:mobx/mobx.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/model/summary_model.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'create_summary_controller.g.dart';

class CreateSummaryController = _CreateSummaryControllerBase
    with _$CreateSummaryController;

abstract class _CreateSummaryControllerBase with Store {
  final ICreateSummary usecase;

  @observable
  bool presentation = false;

  @observable
  SummaryModel summaryModel;

  _CreateSummaryControllerBase(this.usecase);

  @action
  setRegistration(value) => summaryModel =
      SummaryModel(user: UserEntity(accountIdentification: value.toInt()));

  @action
  setInstituition(value) => summaryModel = SummaryModel(userInstitution: value);

  @action
  setEvent(value) => summaryModel = SummaryModel(inscriptionId: value.toInt());

  @action
  setTitle(value) => summaryModel = SummaryModel(inscriptionId: value.toInt());

  @action
  setDescription(value) => summaryModel = SummaryModel(description: value);

  @action
  setPresentation(bool value) => presentation = value;

  @action
  sendSummary() async {
    var result = await usecase(summaryModel);
    result.fold((l) {
      asuka.showSnackBar(SnackBar(content: Text('Deu ruim')));
    }, (r) {
      asuka.showSnackBar(SnackBar(content: Text('Deu Bão')));
    });
  }
}
