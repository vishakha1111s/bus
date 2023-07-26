import 'package:flutter/material.dart';
import 'package:untitled2/domain/entities/news_model.dart';
import 'package:untitled2/utils/constants.dart';

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
      padding: const EdgeInsets.only(top: padding_16),
      child: Center(
        child: Card(
          elevation: padding_4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: const EdgeInsets.fromLTRB(padding_16, 0, padding_16, padding_16),
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
                      child: NewsDetail("$source${article?.source?.name ?? ""}",
                          Theme.of(context).textTheme.bodyText2, context)),
                  Center(
                      child: NewsDetail("$id${article?.source?.id ?? ""}",
                          Theme.of(context).textTheme.bodyText2, context)),
                  Center(
                      child: NewsDetail(
                          "$author${article?.author ?? ""}",
                          Theme.of(context).textTheme.bodyText2,
                          context)),
                  Center(
                      child: NewsDetail(
                          "$published${article?.publishedAt ?? ""}",
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
    padding: EdgeInsets.all(padding_8),
    child: Container(
        child: Text(
      text,
      style: textStyle,
    )),
  );
}
