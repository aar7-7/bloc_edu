import 'package:bloctrain/bloc/event.dart';
import 'package:bloctrain/bloc/state.dart';
import 'package:bloctrain/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  late final Repository _repository;
  ArticleBloc(this._repository) : super(ArticleLoadingState()) {
    on<LoadArticleEvent>(
      (event, emit) async {
        emit(ArticleLoadingState());
        try {
          final articles = await _repository.getArticles();
          emit(ArticleLoadedState(articles));
        } catch (e) {
          emit(ArticleErrorState(e.toString()));
        }
      },
    );
  }
}
