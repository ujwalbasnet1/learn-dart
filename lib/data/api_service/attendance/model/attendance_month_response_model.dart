class AttendanceMonthResponseModel {
  String? id;
  String? inTime;
  String? outTime;
  String? date;
  String? studentId;
  String? userId;

  AttendanceMonthResponseModel(
      {this.id,
      this.inTime,
      this.outTime,
      this.date,
      this.studentId,
      this.userId});

  AttendanceMonthResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inTime = json['inTime'];
    outTime = json['outTime'];
    date = json['date'];
    studentId = json['studentId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inTime'] = this.inTime;
    data['outTime'] = this.outTime;
    data['date'] = this.date;
    data['studentId'] = this.studentId;
    data['userId'] = this.userId;
    return data;
  }
}
