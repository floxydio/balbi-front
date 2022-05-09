import 'package:balbinew/Bloc/cubit/anak_cubit.dart';
import 'package:balbinew/Components/inputform_widget.dart';
import 'package:balbinew/Components/spasi_widget.dart';
import 'package:balbinew/Models/anak_model.dart';
import 'package:balbinew/Service/color_service.dart';
import 'package:balbinew/Service/font_service.dart';
import 'package:balbinew/Service/image_service.dart';
import 'package:balbinew/Service/size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterAnak extends StatefulWidget {
  final int? idUser;
  const RegisterAnak({Key? key, this.idUser}) : super(key: key);

  @override
  State<RegisterAnak> createState() => _RegisterAnakState();
}

class _RegisterAnakState extends State<RegisterAnak> {
  final namaAnakController = TextEditingController();
  final namaPanggilanController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final panjangBadanController = TextEditingController();
  final lingkarKepalaController = TextEditingController();
  final beratBadanController = TextEditingController();

  int? genderSelect;

  @override
  void dispose() {
    super.dispose();
    namaAnakController.dispose();
    namaPanggilanController.dispose();
    tanggalLahirController.dispose();
    panjangBadanController.dispose();
    lingkarKepalaController.dispose();
    beratBadanController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageService().logo,
                  width: 59,
                  height: 24,
                ),
                const Spasi(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          genderSelect = 0;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                color: colorTextLogin, shape: BoxShape.circle),
                          ),
                          const Spasi(
                            height: 10,
                          ),
                          const Text("Laki - Laki")
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          genderSelect = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                color: colorTextLogin, shape: BoxShape.circle),
                          ),
                          const Spasi(height: 10),
                          const Text("Perempuan")
                        ],
                      ),
                    ),
                  ],
                ),
                const Spasi(height: 30),
                FormInput(
                  controller: namaAnakController,
                  labelText: "Nama Anak",
                ),
                const Spasi(height: 10),
                FormInput(
                  controller: namaPanggilanController,
                  labelText: "Nama Panggilan Anak",
                ),
                const Spasi(height: 10),
                FormInput(
                  controller: tanggalLahirController,
                  labelText: "Tanggal Lahir",
                ),
                const Spasi(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 0.4,
                      width: 100,
                      child: Container(color: grey),
                    ),
                    const Text("Data Saat Ini"),
                    SizedBox(
                      height: 0.4,
                      width: 100,
                      child: Container(color: grey),
                    ),
                  ],
                ),
                const Spasi(height: 20),
                FormInput(
                  controller: panjangBadanController,
                  labelText: "Tinggi Badan",
                ),
                const Spasi(
                  height: 10,
                ),
                FormInput(
                  controller: beratBadanController,
                  labelText: "Berat Badan",
                ),
                const Spasi(
                  height: 10,
                ),
                FormInput(
                  controller: lingkarKepalaController,
                  labelText: "Lingkar Kepala",
                ),
                SizedBox(
                    width: getWidth(context),
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: colorTextLogin,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          int? dataID = prefs.getInt("iduser");
                          var data = AnakModel(
                            beratbadan: int.parse(beratBadanController.text),
                            gender: genderSelect,
                            lingkarkepala:
                                int.parse(lingkarKepalaController.text),
                            namaanak: namaAnakController.text,
                            namapanggilan: namaPanggilanController.text,
                            panjangbadan:
                                int.parse(panjangBadanController.text),
                            tanggallahir: tanggalLahirController.text,
                            userid: dataID,
                          );

                          context.read<AnakCubit>().sendAnakPertama(data);
                        },
                        child: Text(
                          "Tambahkan Anak",
                          style: changeFontColor(standarBoldText, white),
                        ))),
              ],
            )),
      )),
    );
  }
}
