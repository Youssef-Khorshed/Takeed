import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/Theme/themecubit.dart';
import 'package:takeed/core/DI/dependencyInjection.dart';
import 'package:takeed/core/Routes/app_routes.dart';
import 'package:takeed/core/Routes/routes.dart';

class Takeed extends StatelessWidget {
  final AppRoutes appRoutes;
  const Takeed({
    super.key,
    required this.appRoutes,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
          BlocProvider<FlightCubit>(create: (context) => getit<FlightCubit>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, theme) {
          return ScreenUtilInit(
            designSize: const Size(360, 874),
            minTextAdapt: true,
            child: MaterialApp(
              theme: theme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRoutes.generateroute,
              initialRoute: Routes.splash,
            ),
          );
        }));
  }
}
