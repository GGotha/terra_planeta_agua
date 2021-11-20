import 'package:flutter/material.dart';
import 'package:terra_planeta_agua/src/models/report_model.dart';
import 'package:terra_planeta_agua/src/ui/widgets/custom_progress_bar.dart';

// ignore: must_be_immutable
class ReportList extends StatelessWidget {
  ReportModel reports;

  ReportList({
    Key key,
    this.reports,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                "/report-details",
                arguments: reports,
              );
            },
            child: ListTile(
              title: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  reports.title,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PH da Água'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    CustomProgressBar(
                      value: reports.waterPHProgressBar,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
