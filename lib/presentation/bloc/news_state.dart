


import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {

}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadCompleteState extends NewsState {
  NewsLoadCompleteState();
  @override
  List<Object?> get props => [];
}

class NewsErrorState extends NewsState {
  @override
  List<Object?> get props => [];
}
