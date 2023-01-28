import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial()) {
    on<FetchLanguageEvent>((event, emit) => _callMyApi(event, emit));
  }

  void _callMyApi(FetchLanguageEvent event, Emitter<LangState> emit) async {
    emit(LangSuccess(locale: event.local));
  }
}
