import 'package:flutter/material.dart';
import 'package:untitled2/domain/entities/news_model.dart';

Widget NewsDescriptionPage(Article? article, BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey,
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
        //replace with our own icon data.
      ),
    ),
    body: Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                NewsDetail(article?.title ?? "", 24, FontWeight.w800),
                Image.network(article?.urlToImage ?? ""),
                NewsDetail(article?.description ?? "", 18, FontWeight.w300),
                NewsDetail("${article?.content ?? ""}", 20, FontWeight.w400),
                Center(
                    child: NewsDetail("Source ${article?.source?.name ?? ""}",
                        20, FontWeight.w700)),
                Center(
                    child: NewsDetail("Id is ${article?.source?.id ?? ""}", 20,
                        FontWeight.w700)),
                Center(
                    child: NewsDetail(
                        "Author of the News - ${article?.author ?? ""}",
                        16,
                        FontWeight.w400)),
                Center(
                    child: NewsDetail(
                        "PublishedAt ${article?.publishedAt ?? ""}",
                        14,
                        FontWeight.w500)),
              ]),
        ),
      ),
    ),
  );
}

Widget NewsDetail(String text, double fontSize, FontWeight fontWeight) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Container(
        child: Text(
      text,
      style: TextStyle(
          color: Colors.black87, fontSize: fontSize, fontWeight: fontWeight),
    )),
  );
}
