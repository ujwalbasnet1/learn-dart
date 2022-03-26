class SupportReplyRequestModel {
  String? description;
  List<String>? attachments;

  SupportReplyRequestModel({this.description, this.attachments});

  SupportReplyRequestModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    attachments = json['attachments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['attachments'] = this.attachments;
    return data;
  }
}
