import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takeed/Features/Auth/Logic/LoginCubit/logincubit.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';

Future<void> loginlogic(
    {required BuildContext context, String? selectedChoice}) async {
  final choice = context.read<Logincubit>().selectChoice;
  context.pushNamed(choice == null || choice == 'Email'
      ? Routes.bottomnavigation
      : Routes.otp);
}
