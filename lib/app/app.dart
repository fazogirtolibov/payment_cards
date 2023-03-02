import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/blocs/card_bloc/bloc/card_bloc.dart';
import 'package:last_exam/cubit/tab/tab_cubit.dart';

import '../../utils/constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import '../cubit/get_cards/get_card_cubit.dart';
import '../route.dart';
import '../utils/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(create: (context) => CardBloc()),
        BlocProvider(create: (context) => TabboxCubit()),
        BlocProvider(
          create: (context) => GetCardCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => MaterialApp(
          title: 'Card Payment',
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRouter.generateRoute,
          initialRoute: splashPage,
        ),
      ),
    );
  }
}
