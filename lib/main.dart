import 'package:balbinew/Bloc/cubit/anak_cubit.dart';
import 'package:balbinew/Bloc/cubit/article_cubit.dart';
import 'package:balbinew/Bloc/cubit/auth_cubit.dart';
import 'package:balbinew/Pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<AnakCubit>(
          create: (context) => AnakCubit(),
        ),
        BlocProvider<ArticleCubit>(create: (context) => ArticleCubit())
      ],
      child: const GetMaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    ));
