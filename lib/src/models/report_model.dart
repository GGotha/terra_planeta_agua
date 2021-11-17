class ReportModel {
  int id;
  int userId;
  String title;
  bool completed;
  double waterPH;
  String place;

  ReportModel({
    this.id,
    this.title,
    this.completed,
    this.waterPH,
    this.place,
  });
}
