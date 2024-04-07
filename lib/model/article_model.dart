import 'dart:ffi';

class ArticleModel {
  late String id;
  late String title;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late bool isFavorite;
  late String createdAt;
  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.isFavorite,
    required this.createdAt,
  });
  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    author = json['author'];
    view = (json['view']);
    status = (json['status']);
    isFavorite = json['isFavorite'];
    createdAt = json['created_at'];
  }
}
