import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
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
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @observable
  bool presentation = false;

  @observable
  SummaryModel summaryModel = SummaryModel();

  @observable
  File filePDF;

  @observable
  File fileVideo;

  @observable
  var time;

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
    time = DateTime.now();
    await uploadPdf();
    await uploadMovie();
    /* var result = await usecase(summaryModel);
    result.fold((l) {
      asuka.showSnackBar(SnackBar(content: Text('Deu ruim')));
    }, (r) {
      asuka.showSnackBar(SnackBar(content: Text('Deu Bão')));
    });*/
  }

  @action
  getPdf() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return filePDF = File(result.files.single.path);
    } else {
      asuka.showSnackBar(SnackBar(content: Text('Deu ruim')));
    }
  }

  @action
  uploadPdf() async {
    await storage
        .ref('$time/summary.pdf')
        .putFile(filePDF)
        .then((value) async {
      return summaryModel.summary = await value.ref.getDownloadURL();
    });
  }

  @action
  getMovie() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return fileVideo = File(result.files.single.path);
    } else {
      asuka.showSnackBar(SnackBar(content: Text('Deu ruim')));
    }
  }

  @action
  uploadMovie() async {
    await storage
        .ref('$time/movie.mp4')
        .putFile(fileVideo)
        .then((value) async {
      return summaryModel.video = await value.ref.getDownloadURL();
    });
  }
}
