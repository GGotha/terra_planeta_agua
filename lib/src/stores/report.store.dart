import 'package:mobx/mobx.dart';
import 'package:terra_planeta_agua/src/models/report_model.dart';
part 'report.store.g.dart';

class ReportStore = _ReportStore with _$ReportStore;

abstract class _ReportStore with Store {
  @observable
  var reports = ObservableList<ReportModel>();

  @action
  void add(ReportModel report) {
    reports.add(report);
  }
}
