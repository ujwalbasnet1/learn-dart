class AddSupportRequestModel {
  String? subject;
  String? description;
  List<String>? attachments;

  AddSupportRequestModel({this.subject, this.description, this.attachments});

  AddSupportRequestModel.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    description = json['description'];
    attachments = json['attachments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['description'] = this.description;
    data['attachments'] = this.attachments;
    return data;
  }
}
