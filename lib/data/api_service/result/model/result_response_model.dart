class ResultResponseModel {
  String? id;
  String? studentId;
  String? subjectId;
  String? examYear;
  String? examType;
  String? grade;
  double? obtainedMark;
  Subject? subject;

  ResultResponseModel(
      {this.id,
      this.studentId,
      this.subjectId,
      this.examYear,
      this.examType,
      this.grade,
      this.obtainedMark,
      this.subject});

  ResultResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['studentId'];
    subjectId = json['subjectId'];
    examYear = json['exam_year'];
    examType = json['exam_type'];
    grade = json['grade'];
    obtainedMark = double.tryParse(json['obtained_mark']);
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['studentId'] = this.studentId;
    data['subjectId'] = this.subjectId;
    data['exam_year'] = this.examYear;
    data['exam_type'] = this.examType;
    data['grade'] = this.grade;
    data['obtained_mark'] = this.obtainedMark;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class Subject {
  String? id;
  String? code;
  String? title;
  String? description;
  double? fullMark;
  double? passMark;

  Subject(
      {this.id,
      this.code,
      this.title,
      this.description,
      this.fullMark,
      this.passMark});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    title = json['title'];
    description = json['description'];
    fullMark = double.tryParse(json['full_mark']);
    passMark = double.tryParse(json['pass_mark']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['title'] = this.title;
    data['description'] = this.description;
    data['full_mark'] = this.fullMark;
    data['pass_mark'] = this.passMark;
    return data;
  }
}
