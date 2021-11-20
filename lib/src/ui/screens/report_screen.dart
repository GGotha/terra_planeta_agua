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
    List dropdownListItem = [
      "2015",
      "2016",
      "2017",
      "2018",
      "2019",
      "2020",
      "2021",
      "Todos"
    ];

    final reportStore = ReportStore();

    return Scaffold(
      backgroundColor: ONGBlueColor,
      appBar: CustomAppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                "/about",
              );
            },
            child: Icon(
              Icons.clean_hands,
              color: Colors.black,
            ),
          ),
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
              margin: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),
            iconSize: 25,
            onChanged: (dropdownValue) async {
              if (dropdownValue == "2015" ||
                  dropdownValue == "2016" ||
                  dropdownValue == "2017" ||
                  dropdownValue == "2018" ||
                  dropdownValue == "2019" ||
                  dropdownValue == "2020" ||
                  dropdownValue == "2021") {
                return await ReportProvider()
                    .getReportsByYear(reportStore, dropdownValue);
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
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: reportStore.reports.length != 0
                          ? ListView.builder(
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
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              child: Text('Não há relatórios nesta data'),
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
    );
  }
}
