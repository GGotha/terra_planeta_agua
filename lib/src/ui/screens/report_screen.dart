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
    List dropdownListItem = ["Hoje", "14 dias", "1 mês", "Todos"];

    final reportStore = ReportStore();

    return Scaffold(
      backgroundColor: ONGBlueColor,
      appBar: CustomAppBar(
        actions: [
          DropdownButton(
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
            elevation: 0,
            icon: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),
            iconSize: 25,
            onChanged: (dropdownValue) async {
              if (dropdownValue == "Hoje") {
                return await ReportProvider().getTodayReports(reportStore);
              }
              if (dropdownValue == "14 dias") {
                return await ReportProvider().getTwoWeeksReports(reportStore);
              }

              if (dropdownValue == "1 mês") {
                return await ReportProvider().getOneMonthReports(reportStore);
              }

              if (dropdownValue == "Todos") {
                return await ReportProvider().getAllReports(reportStore);
              }
            },
            items: dropdownListItem.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
          )
          // Container(
          //   margin: EdgeInsets.only(right: 10),
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.filter_list,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {},
          //   ),
          // )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Text(
              'Relatórios Sustentáveis',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ReportProvider().getAllReports(reportStore),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Observer(
                    builder: (_) => Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: ListView.builder(
                        itemCount: reportStore.reports.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Column(
                              children: [
                                ReportList(
                                  reports: reportStore.reports[index],
                                ),
                              ],
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
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
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
