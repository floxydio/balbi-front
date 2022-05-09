// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  ArticleModel({
    this.data,
    this.status,
  });

  List<ArticleData>? data;
  int? status;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        data: List<ArticleData>.from(
            json["data"].map((x) => ArticleData.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
      };
}

class ArticleData {
  ArticleData({
    this.id,
    this.title,
    this.content,
    this.author,
    this.rating,
    this.createdAt,
  });

  int? id;
  String? title;
  String? content;
  String? author;
  int? rating;
  String? createdAt;

  factory ArticleData.fromJson(Map<String, dynamic> json) => ArticleData(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        author: json["author"],
        rating: json["rating"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "author": author,
        "rating": rating,
        "created_at": createdAt,
      };
}
