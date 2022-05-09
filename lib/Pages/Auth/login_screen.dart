import 'package:balbinew/Models/user_model.dart';
import 'package:balbinew/Pages/Auth/register_screen.dart';
import 'package:balbinew/Service/color_service.dart';
import 'package:balbinew/Service/font_service.dart';
import 'package:balbinew/Service/image_service.dart';
import 'package:balbinew/Service/size_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Bloc/cubit/auth_cubit.dart';
import '../../Components/inputpassword_widget.dart';
import '../../Components/inputtext_widget.dart';
import '../../Components/spasi_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spasi(
                  height: 20,
                ),
                Image.asset(ImageService().dummyLogin),
                const Spasi(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Sign In For Free",
                    style: changeFontColor(mediumBoldText, colorTextLogin),
                  ),
                ),
                const Spasi(
                  height: 20,
                ),
                AuthInput(
                  controller: emailController,
                  labelText: "Email atau Username",
                ),
                const Spasi(
                  height: 10,
                ),
                AuthPassword(
                  controller: passwordController,
                  isSuffix: true,
                  isPassword: true,
                  labelText: "Password",
                ),
                const Spasi(
                  height: 20,
                ),
                SizedBox(
                    width: getWidth(context),
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: colorTextLogin,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          var data = UserModel(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          context.read<AuthCubit>().login(data);
                          // Get.off(const HomeScreen());
                        },
                        child: Text(
                          "Masuk",
                          style: changeFontColor(standarBoldText, white),
                        ))),
                const Spasi(
                  height: 15,
                ),
                Center(
                  child: Text.rich(TextSpan(
                    text: "Belum punya akun? ",
                    style: smallGreyText,
                    children: [
                      TextSpan(
                        text: "Daftar",
                        style: smallSecondary,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(const Register());
                          },
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
