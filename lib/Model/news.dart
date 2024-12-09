import 'package:intl/intl.dart';

class Data {
  String? title;
  String? link;
  String? contentSnippet;
  String? description;
  String? content;
  String? isoDate;
  String? image;

  Data({this.title, this.link, this.contentSnippet, this.isoDate, this.image, this.description, this.content});

  Data.fromJson(Map json) {
    title = json['title'];
    link = json['link'];
    contentSnippet = json['contentSnippet'];
    description = json['description'];
    content = json['content'];
    
    // Format the date to DD/MM/YY
    if (json['isoDate'] != null) {
      DateTime date = DateTime.parse(json['isoDate']);
      isoDate = DateFormat('dd/MM/yy').format(date);
    }

    image = json['image'];
  }

  Map toJson() {
    final Map data = {};
    data['title'] = this.title;
    data['link'] = this.link;
    data['contentSnippet'] = this.contentSnippet;
    data['description'] = this.description;

    // Convert the formatted date back to ISO format if needed
    if (isoDate != null) {
      DateTime date = DateFormat('dd/MM/yy').parse(isoDate!);
      data['isoDate'] = DateFormat('yyyy-MM-dd').format(date);
    } else {
      data['isoDate'] = null;
    }

    data['image'] = this.image;
    return data;
  }
}
