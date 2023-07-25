import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/domain/entities/news_model.dart';
import 'package:untitled2/domain/usecases/get_news.dart';
import 'package:untitled2/presentation/bloc/news_event.dart';

import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  late NewsModel newsModelRequest;
  final GetNews getNews;

  NewsBloc({required this.getNews})
      : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        var result = await getNews.call(newsModelRequest);
        if (result != null)
          emit(NewsLoadCompleteState());
        else
          emit(NewsErrorState());
      } catch (e) {
        emit(NewsErrorState());
      }
    });
  }
}