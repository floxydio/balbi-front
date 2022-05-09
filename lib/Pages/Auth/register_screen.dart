import 'package:balbinew/Bloc/cubit/auth_cubit.dart';
import 'package:balbinew/Models/user_model.dart';
import 'package:balbinew/Service/color_service.dart';
import 'package:balbinew/Service/font_service.dart';
import 'package:balbinew/Service/size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Components/inputtext_widget.dart';
import '../../Components/spasi_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropdownValue = 'Apa makanan favorit kamu?';
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final retypeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            const Spasi(
              height: 40,
            ),
            Center(
              child: Text(
                "Sign Up For Free",
                style: changeFontColor(mediumBoldText, colorTextLogin),
              ),
            ),
            const Spasi(
              height: 20,
            ),
            AuthInput(
              controller: nameController,
              labelText: "Name",
            ),
            const Spasi(
              height: 5,
            ),
            AuthInput(
              controller: phoneController,
              labelText: "Phone Number",
            ),
            const Spasi(
              height: 5,
            ),
            AuthInput(
              controller: emailController,
              labelText: "Email",
            ),
            const Spasi(
              height: 5,
            ),
            AuthInput(
              controller: passwordController,
              isPassword: true,
              labelText: "Password",
            ),
            const Spasi(
              height: 20,
            ),
            AuthInput(
              controller: retypeController,
              isPassword: true,
              labelText: "Konfirmasi Password",
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
                        nama: nameController.text,
                        phone: int.parse(phoneController.text),
                        password: passwordController.text,
                      );
                      context.read<AuthCubit>().register(data);
                    },
                    child: Text(
                      "Sign Up",
                      style: changeFontColor(standarBoldText, white),
                    ))),
            // Text(
            //   "Hint Keamanan",
            //   style: changeFontColor(largePatrickText, colorInput),
            // ),
            // SizedBox(
            //   width: getWidth(context),
            //   child: DropdownButton<String>(
            //     isExpanded: true,
            //     value: dropdownValue,
            //     hint: const Text("Pilih pertanyaan yang anda mau"),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         dropdownValue = newValue!;
            //       });
            //     },
            //     items: <String>[
            //       'Apa makanan favorit kamu?',
            //       'Siapa artis favorit mu?',
            //       'Siapa pemilik apple?'
            //     ].map<DropdownMenuItem<String>>((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),
            //   ),
            // ),
            // const Spasi(
            //   height: 10,
            // ),
            // const AuthInput(
            //   helper:
            //       "*Jangan beritahu jawaban kamu kepada orang yang tidak dikenal",
            //   labelText: "Jawaban",
            // ),
            // const Spasi(
            //   height: 20,
            // ),
          ],
        ),
      )),
    ));
  }
}
