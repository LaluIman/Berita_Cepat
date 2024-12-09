import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_flutter/Model/news.dart';
import 'package:newsapp_flutter/Network/netclient.dart';
import 'package:newsapp_flutter/Response/news_response.dart';
import 'package:newsapp_flutter/widgets/bottom_nav.dart';
import 'package:newsapp_flutter/widgets/skeleton_item.dart';
import 'package:newsapp_flutter/screens/detail/detail_screen.dart';

List<String> _newsList = [
  'Tribun news',
  'Antara news',
  'Zeziten news',
  'Voa news',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexBar = 0;
  String? _selectedNews = 'Tribun news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              "assets/BeritacepatFAV.png",
              width: 45,
              height: 45,
            ),
            Text(
              "Berita cepat",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButtonHideUnderline(
                child: SizedBox(
                  width: 130,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: Icon(
                      Icons.cell_tower,
                      size: 25,
                    ),
                    value: _selectedNews,
                    hint: Text(_selectedNews ?? 'Select News'),
                    items: _newsList.map((String news) {
                      return DropdownMenuItem<String>(
                        value: news,
                        child: Text(
                          news,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedNews = newValue!;
                        indexBar = _selectedNews == 'Tribun news'
                            ? 0
                            : _selectedNews == 'Antara news'
                                ? 1
                                : _selectedNews == 'Zeziten news'
                                    ? 2
                                    : 3;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<NewsResponse>(
        future: Netclient().fetchNews(indexBar == 0
            ? "tribun-news/jakarta"
            : indexBar == 1
                ? "antara-news/terkini"
                : indexBar == 2
                    ? "zetizen-jawapos-news/trend"
                    : "voa-news"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SkeletonItemView();
          } else if (snapshot.hasError) {
            return ErrorView();
          } else {
            final news = snapshot.data!.data!;

            return ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return NewsListItem(news: news[index]);
                  },
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 30,
            color: Colors.red,
          ),
          SizedBox(height: 10),
          Text(
            "Gagal memuat berita :(",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            "Cek koneksi internet kamu",
            style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class NewsListItem extends StatelessWidget {
  const NewsListItem({
    super.key,
    required this.news,
  });

  final Data news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(
            news: news,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: news.image!,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.isoDate!,
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    Text(
                      news.title!,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      news.contentSnippet != null
                          ? news.contentSnippet!
                          : news.description != null
                              ? news.description!
                              : news.content!,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
