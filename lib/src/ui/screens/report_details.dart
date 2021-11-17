import 'package:flutter/material.dart';
import 'package:terra_planeta_agua/src/models/report_model.dart';
import 'package:terra_planeta_agua/src/ui/widgets/custom_app_bar.dart';
import 'package:terra_planeta_agua/src/ui/widgets/custom_progress_bar.dart';

class ReportDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReportModel reports = ModalRoute.of(context).settings.arguments;

    // final reports = object['reports'];

    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Text(
                  'Informações Adicionais',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Relatório: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Flexible(
                      child: Text(
                        reports.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Relatório finalizado: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      reports.completed ? "Sim" : "Não",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Local de geração do Relatório: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      reports.place,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'PH da Água',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                CustomProgressBar(
                  value: reports.waterPH,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
