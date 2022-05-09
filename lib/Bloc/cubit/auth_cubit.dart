import 'package:balbinew/Models/user_model.dart';
import 'package:balbinew/Pages/Auth/login_screen.dart';
import 'package:balbinew/Pages/User/home_page.dart';
import 'package:balbinew/Service/api_const.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await Dio().post(ApiService.baseUrl + ApiService.login,
        data: FormData.fromMap({
          "email": user.email,
          "password": user.password,
        }),
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    if (response.statusCode == 200) {
      route.Get.off(HomeScreen(
        nama: response.data["data"]["nama"],
      ));
      prefs.setString("token", response.data["token"]);
      prefs.setInt("iduser", response.data["data"]["id"]);
    }
    emit(AuthInitial());
  }

  void register(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await Dio().post(ApiService.baseUrl + ApiService.register,
        data: FormData.fromMap({
          "email": user.email,
          "password": user.password,
          "nama": user.nama,
          "phone": user.phone,
        }),
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print(response.data);
    if (response.data["status"] == 200) {
      route.Get.off(HomeScreen(
        nama: response.data["data"]["nama"],
      ));
      prefs.setString("token", response.data["token"]);
      prefs.setInt("iduser", response.data["data"]["id"]);
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("iduser");

    route.Get.off(const LoginScreen());
  }

  void checkAvailableToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print(token);
    var response = await Dio().post(ApiService.baseUrl + ApiService.checkuser,
        data: FormData.fromMap({
          "jwt": token,
        }),
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print(response.data);
    if (response.data["token"] == false) {
      route.Get.showSnackbar(const route.GetSnackBar(
        duration: Duration(seconds: 2),
        message: "Token expired, Silahkan login kembali",
      ));
      prefs.remove("token");
      prefs.remove("iduser");
      route.Get.offAll(const LoginScreen());
    }
  }
}
