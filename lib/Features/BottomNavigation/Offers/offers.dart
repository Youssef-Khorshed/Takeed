import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Offers/offerPageDetails.dart';

class OffersPage extends StatelessWidget {
  final List<FlightOffer> offers = [
    FlightOffer("Flight to New York", "200 USD", "Best offer for New York."),
    FlightOffer("Flight to London", "300 USD", "Visit the UK with this offer."),
    FlightOffer("Flight to Tokyo", "400 USD", "Experience Japan."),
  ];

  OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Offers'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, _createRoute(offers[index]));
            },
            child: Card(
              color: Colors.white,
              elevation: 4,
              child: Container(
                height: 160.h,
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/offer.png'),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(offers[index].title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text('Price: ${offers[index].price}',
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 10),
                        Text(offers[index].description,
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Route _createRoute(FlightOffer offer) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          OfferDetailPage(offer: offer),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from the right
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
}
