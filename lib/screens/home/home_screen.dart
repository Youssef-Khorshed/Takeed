import 'package:flutter/material.dart';
import 'package:takeed/colors/myapp_colors.dart';
import 'package:takeed/core/app_constants.dart';
import 'package:takeed/core/app_routes.dart';
import 'package:takeed/screens/home/home_tabs/home_tab.dart';
import 'package:takeed/screens/home/home_tabs/inbox_tab.dart';
import 'package:takeed/screens/home/home_tabs/profile_tab.dart';
import 'package:takeed/screens/search/flight_search_screen/flight_search_screen.dart';

import '../../core/app_assets.dart';
import 'home_tabs/offer_tab.dart';
import 'home_tabs/search_tab.dart';


class HomeScreen extends StatefulWidget{
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int selectedTab=0;

List<Widget> tabs = [
  HomeTab(),
  SearchTab(),
  OfferTab(),
  InboxTab(),
  ProfileTab()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
        titleTextStyle: TextStyle(fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        backgroundColor: MyAppColors.primary,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: selectedTab,
        onTap: (index){

       selectedTab = index;
       setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: AppConstants.home),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online), label: AppConstants.search),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: AppConstants.offer),
          BottomNavigationBarItem(
              icon: Icon(Icons.inbox), label: AppConstants.inbox),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: AppConstants.profile),
        ],
      ),
      body: tabs[selectedTab] ,
    );
  }
}

