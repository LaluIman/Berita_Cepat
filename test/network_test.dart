import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp_flutter/Model/news_response.dart';
import 'package:newsapp_flutter/Network/netclient.dart';

void main() {
  group('Network Test', () {
    test('YEASSS', () async {
      final NewsResponse responseI = await Netclient().fetchNews("tribun-news/jakarta");
      print(responseI.toJson());
    });
  });
}

