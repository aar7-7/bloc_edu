import 'package:bloctrain/model/article_model.dart';
import 'package:equatable/equatable.dart';

abstract class ArticleState extends Equatable {}

class ArticleLoadingState extends ArticleState {
  @override
  List<Object?> get props => [];
}

class ArticleLoadedState extends ArticleState {
  final List<ArticleModel> list;
  ArticleLoadedState(this.list);
  @override
  List<Object?> get props => [list];
}

class ArticleErrorState extends ArticleState {
  final String errorText;
  ArticleErrorState(this.errorText);
  @override
  List<Object?> get props => [errorText];
}
