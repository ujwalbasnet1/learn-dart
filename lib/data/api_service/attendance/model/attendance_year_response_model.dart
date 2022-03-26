class AttendanceYearResponseModel {
  String? month;
  int? total;
  int? present;
  int? absent;

  double get presentPercent => ((total == 0) ? 0 : (present! * 100 / total!));

  AttendanceYearResponseModel(
      {this.month, this.total, this.present, this.absent});

  AttendanceYearResponseModel.fromJson(Map<String, dynamic> json) {
    print(json);
    month = json['month'];
    total = json['total'];
    present = json['present'];
    absent = json['absent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['total'] = this.total;
    data['present'] = this.present;
    data['absent'] = this.absent;
    return data;
  }
}
