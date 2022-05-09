import 'package:balbinew/Models/anak_model.dart';
import 'package:balbinew/Pages/User/home_page.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Service/api_const.dart';

abstract class AnakState extends Equatable {
  const AnakState();

  @override
  List<Object> get props => [];
}

class AnakInitial extends AnakState {}

class AnakList extends AnakState {
  final Map<String, dynamic> data;

  const AnakList({required this.data});
  @override
  List<Object> get props => [data];
}

class AnakCubit extends Cubit<AnakState> {
  AnakCubit() : super(AnakInitial());

  Map<String, dynamic> dataAnak = {};

  void getDetailAnak(int? id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    var response =
        await Dio().get(ApiService.baseUrl + ApiService.anakData + "/$id",
            options: Options(
                headers: {"Authorization": "Bearer " + token!},
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }));
    dataAnak = response.data["data"];
    emit(AnakList(data: dataAnak));
  }

  void sendAnakPertama(AnakModel anakModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    var response =
        await Dio().post(ApiService.baseUrl + ApiService.anakKesatuCreate,
            data: FormData.fromMap(anakModel.toJson()),
            options: Options(
                headers: {"Authorization": "Bearer " + token!},
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }));
    if (response.data["status"] == 200) {
      route.Get.showSnackbar(const route.GetSnackBar(
        duration: Duration(seconds: 3),
        message: "Berhasil menambahkan anak pertama",
      ));
      route.Get.offAll(const HomeScreen());
    }
  }
}
