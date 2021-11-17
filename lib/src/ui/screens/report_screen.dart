import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:terra_planeta_agua/src/colors.dart';
import 'package:terra_planeta_agua/src/providers/report_provider.dart';
import 'package:terra_planeta_agua/src/stores/report.store.dart';
import 'package:terra_planeta_agua/src/ui/widgets/custom_app_bar.dart';
import 'package:terra_planeta_agua/src/ui/widgets/report_list.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reportStore = ReportStore();

    return Scaffold(
      backgroundColor: ONGBlueColor,
      appBar: CustomAppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: ReportProvider().getReports(reportStore),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Observer(
              builder: (_) => Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListView.builder(
                  itemCount: reportStore.reports.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: ReportList(
                        reports: reportStore.reports[index],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
            );
          }
        },
      ),
      // body: Observer(
      //   builder: (_) => Container(
      //     margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //     // child: widget(child: ReportList()),
      //     child: ListView.builder(
      //       itemCount: reportStore.reports.length,
      //       itemBuilder: (context, index) {
      //         print('cehga aqui');
      //         return Container(
      //           margin: EdgeInsets.symmetric(
      //             horizontal: 10,
      //             vertical: 5,
      //           ),
      //           child: ReportList(
      //             reports: reportStore.reports[index],
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
