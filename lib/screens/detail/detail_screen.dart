import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_flutter/Model/news.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/link.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.news});

  final Data news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  "Kembali",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 17),
              child: IconButton(
                icon: Icon(Icons.ios_share),
                onPressed: () async {
                  final result =
                      await Share.share('${news.link}');
                  if (result.status == ShareResultStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Center(
                            child: Text('Terima kasih telah membagikan berita!', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          backgroundColor: Colors.black,
                          behavior: SnackBarBehavior.floating,
                        ),
                    );
                  }
                },
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_alarm),
                        SizedBox(
                          width: 5,
                        ),
                        Text(news.isoDate!),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${news.title!}.",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.grey.shade500, width: 1.5),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: news.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        Text(
                          news.content ??
                              news.description ??
                              news.contentSnippet ??
                              'No content available',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Link(
            uri: Uri.parse(news.link!),
            builder: (context, followlink) {
              return SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: followlink,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                          angle: 3.14,
                          child: Icon(
                            Icons.air,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Lihat lebih lanjut!",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
