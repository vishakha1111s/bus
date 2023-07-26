import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/data/repositories/news_repository.dart';
import 'package:untitled2/domain/usecases/get_news.dart';
import 'package:untitled2/presentation/bloc/news_bloc.dart';
import 'package:untitled2/presentation/bloc/news_event.dart';
import 'package:untitled2/presentation/bloc/news_state.dart';
import 'package:untitled2/presentation/widgets/news_description_page.dart';
import 'package:untitled2/presentation/widgets/news_search_widget.dart';
import 'package:untitled2/utils/constants.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsBloc _newsBloc =
      NewsBloc(InitialState(), GetNews(NewsRepositoryImpl()));

  @override
  void initState() {
    _newsBloc.add(LoadNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _newsBloc,
      buildWhen: (previousState, state) {
        return (state is NewsLoadCompleteState ||
            state is NewsLoadingState ||
            state is NewsErrorState);
      },
      builder: (BuildContext context, state) {
        if (state is NewsLoadingState) {
          return Container(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsErrorState) {
          return Center(
              child: new Text(
            state.error ?? errorMsg,
            textAlign: TextAlign.start,
          ));
        } else if (state is NewsLoadCompleteState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "$total ${state.newsModel?.totalResults ?? 0}$news",
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // method to show the search bar
                    showSearch(
                        context: context,
                        // delegate to customize the search bar
                        delegate: CustomSearchDelegate(
                            article: state.newsModel?.articles));
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            body: Container(
              child: ListView.separated(
                itemCount: state.newsModel?.totalResults ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDescriptionPage(
                                        state.newsModel?.articles?[index],
                                        context)));
                          },
                          child: Text(
                              state.newsModel?.articles?[index].title ?? "")));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
