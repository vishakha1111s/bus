import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadNewsEvent extends NewsEvent{

  LoadNewsEvent();

  @override
  List<Object> get props => []; //add props
}
class ErrorNewsEvent extends NewsEvent{

  @override
  List<Object> get props => []; //add props
}