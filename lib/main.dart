// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:takeed/core/DI/dependencyInjection.dart';
import 'package:takeed/core/Routes/app_routes.dart';
import 'package:takeed/takeed.dart';

void main() async {
  await intialize();
  runApp(Takeed(appRoutes: AppRoutes()));
}
