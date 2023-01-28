part of 'lang_bloc.dart';

abstract class LangState extends Equatable {
  // final Locale? locale;
  const LangState();
}

class LangInitial extends LangState {
  @override
  List<Object?> get props => [];
}

class LangSuccess extends LangState {
  Locale? locale;

  LangSuccess({this.locale});

  @override
  List<Object?> get props => [locale];
}

class LangFailed extends LangState {
  String msg;
  LangFailed(this.msg);

  @override
  List<Object?> get props => [msg];
}





// part of 'lang_bloc.dart';

// class LangState extends Equatable {
//   final Locale? locale;

//   const LangState({this.locale});

//   factory LangState.initial() => const LangState(locale: Locale('en', ''));

//   LangState copyWith({Locale? locale}) =>
//       LangState(locale: locale ?? this.locale);

//   @override
//   List<Object> get props => [locale!];
// }
