import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Theme/themecubit.dart';
import 'package:takeed/core/Routes/app_routes.dart';
import 'package:takeed/core/Routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp(appRoutes: AppRoutes()));
}

class MyApp extends StatelessWidget {
  AppRoutes appRoutes;
  MyApp({super.key, required this.appRoutes});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, theme) {
          return ScreenUtilInit(
            designSize: const Size(360, 874),
            minTextAdapt: true,
            child: MaterialApp(
              theme: theme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRoutes.generateroute,
              initialRoute: Routes.login,
            ),
          );
        }));
  }
}
