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

  final _$sendSummaryAsyncAction =
      AsyncAction('_CreateSummaryControllerBase.sendSummary');

  @override
  Future sendSummary() {
    return _$sendSummaryAsyncAction.run(() => super.sendSummary());
  }

  final _$_CreateSummaryControllerBaseActionController =
      ActionController(name: '_CreateSummaryControllerBase');

  @override
  dynamic setRegistration(dynamic value) {
    final _$actionInfo = _$_CreateSummaryControllerBaseActionController
        .startAction(name: '_CreateSummaryControllerBase.setRegistration');
    try {
      return super.setRegistration(value);
    } finally {
      _$_CreateSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
summaryModel: ${summaryModel}
    ''';
  }
}
