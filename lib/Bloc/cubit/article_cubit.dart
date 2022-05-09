import 'package:balbinew/Models/anak_model.dart';
import 'package:balbinew/Models/article_model.dart';
import 'package:balbinew/Service/api_const.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as route;

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleData extends ArticleState {
  final List<ArticleData>? data;

  const ArticleData({required this.data});
  @override
  List<Object> get props => [];
}

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  // void articleData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");
  //   var response = await Dio().get(ApiService.baseUrl + ApiService.article,
  //       options: Options(
  //           headers: {"Authorization": "Bearer " + token!},
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status! < 500;
  //           }));
  //   if (response.statusCode == 200) {
  //     emit(ArticleData(
  //         data: ArticleModel.fromJson(response.data).data?.toList()));
  //   }
  // }
}
