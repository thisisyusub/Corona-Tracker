import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsPageOpenClicked extends NewsEvent {
  @override
  List<Object> get props => [];
}
