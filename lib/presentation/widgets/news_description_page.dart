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
    body: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
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
                  NewsDetail(article?.title ?? "",
                      Theme.of(context).textTheme.headline1, context),
                  Image.network(article?.urlToImage ?? ""),
                  NewsDetail(article?.description ?? "",
                      Theme.of(context).textTheme.headline6, context),
                  NewsDetail("${article?.content ?? ""}",
                      Theme.of(context).textTheme.headline6, context),
                  Center(
                      child: NewsDetail("Source ${article?.source?.name ?? ""}",
                          Theme.of(context).textTheme.bodyText2, context)),
                  Center(
                      child: NewsDetail("Id is ${article?.source?.id ?? ""}",
                          Theme.of(context).textTheme.bodyText2, context)),
                  Center(
                      child: NewsDetail(
                          "Author of the News - ${article?.author ?? ""}",
                          Theme.of(context).textTheme.bodyText2,
                          context)),
                  Center(
                      child: NewsDetail(
                          "PublishedAt ${article?.publishedAt ?? ""}",
                          Theme.of(context).textTheme.bodyText2,
                          context)),
                ]),
          ),
        ),
      ),
    ),
  );
}

Widget NewsDetail(String text, TextStyle? textStyle, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Container(
        child: Text(
      text,
      style: textStyle,
    )),
  );
}
