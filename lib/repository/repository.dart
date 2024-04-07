import 'package:bloctrain/model/article_model.dart';
import 'package:dio/dio.dart';

class Repository {
  String url =
      'https://techblog.sasansafari.com/Techblog//api/article/get.php?command=new';
  Future<List<ArticleModel>> getArticles() async {
    List<ArticleModel> list = [];
    await Dio().get(url).then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data) {
          list.add(ArticleModel.fromJson(element));
          print(element);
        }
      }
    });
    return list;
  }
}
