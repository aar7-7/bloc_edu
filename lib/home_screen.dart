// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloctrain/bloc/blocs.dart';
import 'package:bloctrain/bloc/event.dart';
import 'package:bloctrain/bloc/state.dart';
import 'package:bloctrain/model/article_model.dart';
import 'package:bloctrain/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    Repository _repository = RepositoryProvider.of<Repository>(context);
    return BlocProvider(
        create: (context) => ArticleBloc(_repository)
          ..add(
            LoadArticleEvent(),
          ),
        child: Scaffold(
          body:
              BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
            if (state is ArticleLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ArticleLoadedState) {
              List<ArticleModel> articlesList = state.list;

              return ListView.builder(
                itemCount: articlesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(articlesList[index].title),
                  );
                },
              );
            }
            if (state is ArticleErrorState) {
              String error = state.errorText;
              return Center(
                child: Text(error),
              );
            }
            return const Center(child: Text('no data'));
          }),
        ));
  }
}
