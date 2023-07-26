


import 'package:equatable/equatable.dart';
import 'package:untitled2/domain/entities/news_model.dart';

abstract class NewsState extends Equatable {

}

class InitialState extends NewsState {

  @override
  List<Object?> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadCompleteState extends NewsState {

  NewsModel? newsModel;
  NewsLoadCompleteState({this.newsModel});
  @override
  List<Object?> get props => [];
}

class NewsErrorState extends NewsState {
  String? error;
  NewsErrorState({this.error});
  @override
  List<Object?> get props => [];
}
