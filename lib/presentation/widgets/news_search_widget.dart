import 'package:flutter/material.dart';
import 'package:untitled2/domain/entities/news_model.dart';


class CustomSearchDelegate extends SearchDelegate {
  List<Article>? article;
  CustomSearchDelegate({this.article});

// Demo list to show querying
 late List<String> searchTerms = searchTitle(article);

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var title in searchTerms) {
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(title);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

}

List<String> searchTitle(List<Article>? article) {
   List<String> title =[];
   for(int i=0; i< (article?.length ?? 0);i++){
     title.add(article?[i].title ?? "");
   }
   return title;
}


