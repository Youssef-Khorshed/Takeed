import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/HomeScreen.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/loadingShimmer.dart';
import 'package:takeed/Features/BottomNavigation/MyBooking/mybooking.dart';
import 'package:takeed/Features/BottomNavigation/Offers/offers.dart';
import 'package:takeed/Features/BottomNavigation/Profile/profile.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Color/colors.dart';

class HomeScreenButtomNavigation extends StatefulWidget {
  const HomeScreenButtomNavigation({super.key});

  @override
  State<HomeScreenButtomNavigation> createState() =>
      _HomeScreenButtomNavigationState();
}

class _HomeScreenButtomNavigationState
    extends State<HomeScreenButtomNavigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 3) {
        Navigator.of(context).push(_createRoute());
        _selectedIndex = 0;
      } else {
        _selectedIndex = index;
      }
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Start from the bottom
        const end = Offset.zero; // End at the original position
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  final List<Widget> _pages = [
    Homescreen(),
    Mybooking(
      flightdetails: FlightOfferFromPricing(),
    ),
    OffersPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightCubit, FlightState>(
      listener: (context, state) {
        if (context.read<FlightCubit>().state is GetSearchedFlightsResult) {
          if (context.read<FlightCubit>().flightsearchmodel.isNotEmpty) {
            context.pushNamed(Routes.search,
                arguments: context.read<FlightCubit>().flightsearchmodel);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('No flights found'),
            ));
          }
        } else if (context.read<FlightCubit>().state is FlightError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('An error occured')));
        }
      },
      builder: (context, state) {
        if (state is FlightLoading) {
          return Scaffold(
            body: Center(
              child: buildShimmercard(),
            ),
          );
        }
        return Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                      _selectedIndex == 0 ? Icons.home : Icons.home_outlined),
                  label: 'Home',
                  backgroundColor: ColorManager.primaryOrnage),
              BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 1 ? Icons.book : Icons.book_outlined),
                label: 'Booking',
                backgroundColor:
                    ColorManager.primaryOrnage, // <-- This works for shifting
              ),
              BottomNavigationBarItem(
                  icon: Icon(_selectedIndex == 2
                      ? Icons.local_offer
                      : Icons.local_offer_outlined),
                  label: 'Offer'),
              BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 3 ? Icons.person : Icons.person_outlined),
                label: 'Profile',
                backgroundColor: ColorManager.primaryOrnage,
              ),
            ],
            selectedItemColor: Colors.white, // Change selected item color
            unselectedItemColor:
                ColorManager.LightOrangeColor, // Change unselected item color
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
