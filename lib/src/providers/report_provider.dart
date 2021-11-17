import 'dart:math';

import 'package:terra_planeta_agua/src/models/report_model.dart';
import 'package:terra_planeta_agua/src/providers/dio.dart';

class ReportProvider {
  Future<void> getReports(reportStore) async {
    final response = await dio.get(
      '/todos',
    );

    final waterPH = new Random();

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
