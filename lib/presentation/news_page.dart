import 'package:flutter/material.dart';
import 'package:untitled2/presentation/bloc/news_bloc.dart';
import 'package:untitled2/presentation/bloc/news_event.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsBloc _newsBloc;
  @override
  void initState() {
    _newsBloc = NewsBloc(InitialState());
    _newsBloc.add(LoadNewsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
