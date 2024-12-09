import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp_flutter/Network/netclient.dart';
import 'package:newsapp_flutter/Response/news_response.dart';

void main() {
  group('Network Test', () {
    test('YEASSS', () async {
      final NewsResponse responseI = await Netclient().fetchNews("tribun-news/jakarta");
      print(responseI.toJson());
    });
  });
}

