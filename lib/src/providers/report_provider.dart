import 'package:terra_planeta_agua/src/models/report_model.dart';
import 'package:terra_planeta_agua/src/providers/dio.dart';

class ReportProvider {
  Future<void> getAllReports(reportStore) async {
    final response = await dio.get(
      '/',
    );

    reportStore.reports.clear();

    if (response.statusCode == 200) {
      response.data.forEach(
        (report) => reportStore.add(
          new ReportModel(
            id: report['id'],
            title: report['title'],
            completed: report['finished'],
            waterPHProgressBar: report['waterPhReport'],
            waterPH: report['waterPh'],
            place: report['country'],
            date: report['date'],
          ),
        ),
      );
    } else {
      throw Exception('Failed to get reports');
    }
  }

  Future<void> getReportsByYear(reportStore, year) async {
    final response = await dio.get(
      '/byAno/$year',
    );

    reportStore.reports.clear();

    if (response.statusCode == 200) {
      response.data.forEach(
        (report) => reportStore.add(
          new ReportModel(
            id: report['id'],
            title: report['title'],
            completed: report['finished'],
            waterPHProgressBar: report['waterPhReport'],
            waterPH: report['waterPh'],
            place: report['country'],
            date: report['date'],
          ),
        ),
      );
    } else {
      throw Exception('Failed to get reports');
    }
  }
}
