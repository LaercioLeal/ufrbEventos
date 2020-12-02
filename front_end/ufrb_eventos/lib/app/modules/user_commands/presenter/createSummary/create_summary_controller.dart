import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  bool upload = false;

  @observable
  SummaryModel summaryModel = SummaryModel(inscriptionId: 1, enrollment: 1);

  @observable
  File filePDF;

  @observable
  File fileVideo;

  @observable
  var time;

  _CreateSummaryControllerBase(this.usecase);

  @action
  setInstituition(value) => summaryModel.userInstitution = value;

  @action
  setEntrolment(value) => summaryModel.enrollment = int.parse(value);

  @action
  setEvent(value) {
    if (value == "Evento_1") {
      return summaryModel.inscriptionId = 1;
    }

    if (value == "Evento_2") {
      return summaryModel.inscriptionId = 2;
    }

    if (value == "Evento_3") {
      return summaryModel.inscriptionId = 3;
    }

    if (value == "Evento_4") {
      return summaryModel.inscriptionId = 4;
    }

    if (value == "Evento_5") {
      return summaryModel.inscriptionId = 5;
    }
  }

  @action
  setTitle(value) => summaryModel.title = value;

  @action
  setDescription(value) => summaryModel.description = value;

  @action
  setPresentation(bool value) => presentation = value;

  @action
  sendSummary() async {
    debugPrint(summaryModel.toMap().toString());
    upload = true;
    time = DateTime.now();
    if (filePDF != null) {
      await uploadPdf();
    }
    if (fileVideo != null) {
      await uploadMovie();
    }
    var result = await usecase(summaryModel);
    result.fold((l) {
      upload = false;
      asuka.showSnackBar(SnackBar(content: Text('Deu ruim')));
    }, (r) {
      upload = false;
      if (r.response == 'false') {
        asuka
            .showSnackBar(SnackBar(content: Text('Deu ruim, tenta de novo')));
      }
      asuka.showSnackBar(SnackBar(content: Text('Deu Bão')));
    });
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
    await storage.ref('$time/summary.pdf').putFile(filePDF).then((value) async {
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
    await storage.ref('$time/movie.mp4').putFile(fileVideo).then((value) async {
      return summaryModel.video = await value.ref.getDownloadURL();
    });
  }
}
