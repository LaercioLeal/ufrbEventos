// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_summary_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateSummaryController on _CreateSummaryControllerBase, Store {
  final _$presentationAtom =
      Atom(name: '_CreateSummaryControllerBase.presentation');

  @override
  bool get presentation {
    _$presentationAtom.reportRead();
    return super.presentation;
  }

  @override
  set presentation(bool value) {
    _$presentationAtom.reportWrite(value, super.presentation, () {
      super.presentation = value;
    });
  }

  final _$uploadAtom = Atom(name: '_CreateSummaryControllerBase.upload');

  @override
  bool get upload {
    _$uploadAtom.reportRead();
    return super.upload;
  }

  @override
  set upload(bool value) {
    _$uploadAtom.reportWrite(value, super.upload, () {
      super.upload = value;
    });
  }

  final _$summaryModelAtom =
      Atom(name: '_CreateSummaryControllerBase.summaryModel');

  @override
  SummaryModel get summaryModel {
    _$summaryModelAtom.reportRead();
    return super.summaryModel;
  }

  @override
  set summaryModel(SummaryModel value) {
    _$summaryModelAtom.reportWrite(value, super.summaryModel, () {
      super.summaryModel = value;
    });
  }

  final _$filePDFAtom = Atom(name: '_CreateSummaryControllerBase.filePDF');

  @override
  File get filePDF {
    _$filePDFAtom.reportRead();
    return super.filePDF;
  }

  @override
  set filePDF(File value) {
    _$filePDFAtom.reportWrite(value, super.filePDF, () {
      super.filePDF = value;
    });
  }

  final _$fileVideoAtom = Atom(name: '_CreateSummaryControllerBase.fileVideo');

  @override
  File get fileVideo {
    _$fileVideoAtom.reportRead();
    return super.fileVideo;
  }

  @override
  set fileVideo(File value) {
    _$fileVideoAtom.reportWrite(value, super.fileVideo, () {
      super.fileVideo = value;
    });
  }

  final _$timeAtom = Atom(name: '_CreateSummaryControllerBase.time');

  @override
  dynamic get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(dynamic value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$sendSummaryAsyncAction =
      AsyncAction('_CreateSummaryControllerBase.sendSummary');

  @override
  Future sendSummary() {
    return _$sendSummaryAsyncAction.run(() => super.sendSummary());
  }

  final _$getPdfAsyncAction =
      AsyncAction('_CreateSummaryControllerBase.getPdf');

  @override
  Future getPdf() {
    return _$getPdfAsyncAction.run(() => super.getPdf());
  }

  final _$uploadPdfAsyncAction =
      AsyncAction('_CreateSummaryControllerBase.uploadPdf');

  @override
  Future uploadPdf() {
    return _$uploadPdfAsyncAction.run(() => super.uploadPdf());
  }

  final _$getMovieAsyncAction =
      AsyncAction('_CreateSummaryControllerBase.getMovie');

  @override
  Future getMovie() {
    return _$getMovieAsyncAction.run(() => super.getMovie());
  }

  final _$uploadMovieAsyncAction =
      AsyncAction('_CreateSummaryControllerBase.uploadMovie');

  @override
  Future uploadMovie() {
    return _$uploadMovieAsyncAction.run(() => super.uploadMovie());
  }

  final _$_CreateSummaryControllerBaseActionController =
      ActionController(name: '_CreateSummaryControllerBase');

  @override
  dynamic setInstituition(dynamic value) {
    final _$actionInfo = _$_CreateSummaryControllerBaseActionController
        .startAction(name: '_CreateSummaryControllerBase.setInstituition');
    try {
      return super.setInstituition(value);
    } finally {
      _$_CreateSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEntrolment(dynamic value) {
    final _$actionInfo = _$_CreateSummaryControllerBaseActionController
        .startAction(name: '_CreateSummaryControllerBase.setEntrolment');
    try {
      return super.setEntrolment(value);
    } finally {
      _$_CreateSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEvent(dynamic value) {
    final _$actionInfo = _$_CreateSummaryControllerBaseActionController
        .startAction(name: '_CreateSummaryControllerBase.setEvent');
    try {
      return super.setEvent(value);
    } finally {
      _$_CreateSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(dynamic value) {
    final _$actionInfo = _$_CreateSummaryControllerBaseActionController
        .startAction(name: '_CreateSummaryControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(dynamic value) {
    final _$actionInfo = _$_CreateSummaryControllerBaseActionController
        .startAction(name: '_CreateSummaryControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPresentation(bool value) {
    final _$actionInfo = _$_CreateSummaryControllerBaseActionController
        .startAction(name: '_CreateSummaryControllerBase.setPresentation');
    try {
      return super.setPresentation(value);
    } finally {
      _$_CreateSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
presentation: ${presentation},
upload: ${upload},
summaryModel: ${summaryModel},
filePDF: ${filePDF},
fileVideo: ${fileVideo},
time: ${time}
    ''';
  }
}
