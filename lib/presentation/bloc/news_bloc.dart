import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/data/repositories/news_repository.dart';
import 'package:untitled2/domain/entities/news_model.dart';
import 'package:untitled2/domain/usecases/get_news.dart';
import 'package:untitled2/presentation/bloc/news_event.dart';
import 'package:untitled2/presentation/bloc/news_state.dart';
import 'package:untitled2/utils/constants.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNews _getNews;
  NewsBloc(NewsState initialState, this._getNews) : super(initialState) {
    on<NewsEvent>((event, emit) async {
     if (event is ErrorNewsEvent) {
        emit(NewsErrorState(error: errorMsg));
      }  else if (event is LoadNewsEvent) {
        emit(NewsLoadingState());
        try {
          NewsModel newsModel = await _getNews.call();
          if (newsModel != null)
            emit(NewsLoadCompleteState(newsModel: newsModel));
          else
            emit(NewsErrorState(error: errorMsg));
        } catch (e) {
          NewsErrorState(error: e.toString());
        }
      }
    });
  }
}
