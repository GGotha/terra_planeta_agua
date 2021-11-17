import 'dart:math';

import 'package:terra_planeta_agua/src/models/report_model.dart';
import 'package:terra_planeta_agua/src/providers/dio.dart';

class ReportProvider {
  Future<void> getAllReports(reportStore) async {
    final response = await dio.get(
      '/todos',
    );

    final waterPH = new Random();

    reportStore.reports.clear();

    if (response.statusCode == 200) {
      response.data.forEach(
        (report) => reportStore.add(
          new ReportModel(
            id: report['id'],
            title: report['title'],
            completed: report['completed'],
            waterPH: waterPH.nextDouble(),
            place: "São Paulo",
          ),
        ),
      );
    } else {
      throw Exception('Failed to get reports');
    }
  }

  Future<void> getTodayReports(reportStore) async {
    final response = await dio.get(
      '/todos?id=1',
    );

    final waterPH = new Random();

    reportStore.reports.clear();

    if (response.statusCode == 200) {
      response.data.forEach(
        (report) => reportStore.add(
          new ReportModel(
            id: report['id'],
            title: report['title'],
            completed: report['completed'],
            waterPH: waterPH.nextDouble(),
            place: "São Paulo",
          ),
        ),
      );
    } else {
      throw Exception('Failed to get reports');
    }
  }

  Future<void> getTwoWeeksReports(reportStore) async {
    final response = await dio.get(
      '/todos?userId=10',
    );

    final waterPH = new Random();

    reportStore.reports.clear();

    if (response.statusCode == 200) {
      response.data.forEach(
        (report) => reportStore.add(
          new ReportModel(
            id: report['id'],
            title: report['title'],
            completed: report['completed'],
            waterPH: waterPH.nextDouble(),
            place: "São Paulo",
          ),
        ),
      );
    } else {
      throw Exception('Failed to get reports');
    }
  }

  Future<void> getOneMonthReports(reportStore) async {
    final response = await dio.get(
      '/todos?completed=false',
    );

    final waterPH = new Random();

    reportStore.reports.clear();

    if (response.statusCode == 200) {
      response.data.forEach(
        (report) => reportStore.add(
          new ReportModel(
            id: report['id'],
            title: report['title'],
            completed: report['completed'],
            waterPH: waterPH.nextDouble(),
            place: "São Paulo",
          ),
        ),
      );
    } else {
      throw Exception('Failed to get reports');
    }
  }
}
