
class Data {
  String? title;
  String? link;
  String? contentSnippet;
  String? description;
  String? content;
  String? isoDate;
  String? image;

  Data({this.title, this.link, this.contentSnippet, this.isoDate, this.image, this.description, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    contentSnippet = json['contentSnippet'];
    description = json['description'];
    content = json['content'];
    isoDate = (json['isoDate']);
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['link'] = this.link;
    data['contentSnippet'] = this.contentSnippet;
    data['description'] = this.description;
    data['isoDate'] = this.isoDate;
    data['image'] = this.image;
    return data;
  }

}