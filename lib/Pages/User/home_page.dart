import 'package:balbinew/Bloc/cubit/anak_cubit.dart';
import 'package:balbinew/Bloc/cubit/article_cubit.dart';
import 'package:balbinew/Bloc/cubit/auth_cubit.dart';
import 'package:balbinew/Components/spasi_widget.dart';
import 'package:balbinew/Pages/FormAnak/registeranak_screen.dart';
import 'package:balbinew/Service/api_const.dart';
import 'package:balbinew/Service/color_service.dart';
import 'package:balbinew/Service/font_service.dart';
import 'package:balbinew/Service/image_service.dart';
import 'package:balbinew/Service/size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String nama;
  const HomeScreen({Key? key, this.nama = ""}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    checkAvaibleToken();
    getDataAnak();
    // getDataArticle();
  }

  void checkAvaibleToken() =>
      BlocProvider.of<AuthCubit>(context).checkAvailableToken();

  void getDataAnak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? idUser = prefs.getInt('iduser');

    BlocProvider.of<AnakCubit>(context).getDetailAnak(idUser);
  }

  // void getDataArticle() => BlocProvider.of<ArticleCubit>(context).articleData();

  void logoutAccount() => BlocProvider.of<AuthCubit>(context).logout();

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageService().logo,
                      width: 59,
                      height: 24,
                    ),
                    ElevatedButton(
                        onPressed: logoutAccount, child: const Text("Logout"))
                  ],
                ),
                const Spasi(
                  height: 20,
                ),
                _searchMenu(context),
                const Spasi(
                  height: 50,
                ),
                _buildTambahData(context),
                const Spasi(
                  height: 20,
                ),
                _buildIcon(context),
                _buildAds(context),
                // _buildArticle(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildAds(BuildContext context) {
  return Image.network(
    ApiService.imageUrl + "marketads.png",
    fit: BoxFit.cover,
  );
}

Widget _buildArticle(BuildContext context) {
  return BlocBuilder<ArticleCubit, ArticleState>(
    builder: (context, state) {
      if (state is ArticleData) {
        return Text(state.data.toString());
      } else {
        return const SizedBox();
      }
    },
  );
}

Widget _buildTambahData(BuildContext context) {
  return BlocBuilder<AnakCubit, AnakState>(
    builder: (context, state) {
      if (state is AnakList) {
        return state.data["anak"] != null
            ? Card(
                elevation: 0.3,
                child: ListTile(
                  trailing: const Icon(Icons.arrow_drop_down),
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: Text(state.data["anak"][0]["namaanak"].toString()),
                  subtitle: const Text("Lihat Perkembangan anak"),
                ),
              )
            : Container(
                width: getWidth(context),
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xff1CC1CF).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    width: getWidth(context),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          int? idUser;
                          idUser = prefs.getInt('iduser');
                          Get.off(RegisterAnak(
                            idUser: idUser,
                          ));
                        },
                        child: Text(
                          "+ Tambah Data Anak",
                          style:
                              changeFontColor(standarBoldText, colorTextLogin),
                        )),
                  ),
                ),
              );
      } else {
        return const SizedBox();
      }
    },
  );
}

Widget _buildIcon(BuildContext context) {
  return GridView(
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    children: [
      Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              ImageService().icon1,
              fit: BoxFit.cover,
            ),
          ),
          const Spasi(
            height: 11,
          ),
          const Text("Kursus")
        ],
      ),
      Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(ImageService().icon2, fit: BoxFit.cover),
          ),
          const Spasi(
            height: 11,
          ),
          const Text("Kelas Olahraga")
        ],
      ),
      Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(ImageService().icon3, fit: BoxFit.cover),
          ),
          const Spasi(
            height: 11,
          ),
          const Text("Coding Class")
        ],
      ),
      Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(ImageService().icon4, fit: BoxFit.cover),
          ),
          const Spasi(
            height: 11,
          ),
          const Text("Learning Kit")
        ],
      ),
      Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(ImageService().icon5, fit: BoxFit.cover),
          ),
          const Spasi(
            height: 11,
          ),
          const Text("Daycare")
        ],
      ),
    ],
  );
}

Widget _searchMenu(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: getWidth(context) / 1.3,
        height: 45,
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(20)),
            hintText: "Search...",
            hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Container(
        width: 47,
        height: 47,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: const Color(0xff1CC1CF).withOpacity(0.2),
        ),
        child: Icon(
          Icons.notifications,
          color: colorTextLogin,
        ),
      )
    ],
  );
}
