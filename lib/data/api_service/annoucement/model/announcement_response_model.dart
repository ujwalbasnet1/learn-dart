class AnnouncementResponseModel {
  String? id;
  String? title;
  String? description;
  String? createBy;
  String? createdAt;
  AnnouncementCategory? category;

  AnnouncementResponseModel(
      {this.id,
      this.title,
      this.description,
      this.createBy,
      this.createdAt,
      this.category});

  AnnouncementResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createBy = json['createBy'];
    createdAt = json['createdAt'];
    category = json['category'] != null
        ? new AnnouncementCategory.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createBy'] = this.createBy;
    data['createdAt'] = this.createdAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class AnnouncementCategory {
  String? id;
  String? title;
  String? createdBy;

  bool operator ==(o) => o is AnnouncementCategory && title == o.title;
  int get hashCode => title.hashCode;

  AnnouncementCategory({this.id, this.title, this.createdBy});

  AnnouncementCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
