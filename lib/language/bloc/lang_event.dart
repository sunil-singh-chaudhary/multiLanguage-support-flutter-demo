part of 'lang_bloc.dart';

abstract class LangEvent extends Equatable {
  const LangEvent();
}

class FetchLanguageEvent extends LangEvent {
  Locale? local;
  FetchLanguageEvent({this.local});

  @override
  List<Object?> get props => [local];
}
