class ReportModel {
  String id;
  int userId;
  String title;
  bool completed;
  double waterPHProgressBar;
  double waterPH;
  String place;
  String date;

  ReportModel({
    this.id,
    this.title,
    this.completed,
    this.waterPHProgressBar,
    this.waterPH,
    this.place,
    this.date,
  });
}
