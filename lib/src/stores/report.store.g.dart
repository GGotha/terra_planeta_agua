// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportStore on _ReportStore, Store {
  final _$reportsAtom = Atom(name: '_ReportStore.reports');

  @override
  ObservableList<ReportModel> get reports {
    _$reportsAtom.reportRead();
    return super.reports;
  }

  @override
  set reports(ObservableList<ReportModel> value) {
    _$reportsAtom.reportWrite(value, super.reports, () {
      super.reports = value;
    });
  }

  final _$_ReportStoreActionController = ActionController(name: '_ReportStore');

  @override
  void add(ReportModel report) {
    final _$actionInfo =
        _$_ReportStoreActionController.startAction(name: '_ReportStore.add');
    try {
      return super.add(report);
    } finally {
      _$_ReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reports: ${reports}
    ''';
  }
}
