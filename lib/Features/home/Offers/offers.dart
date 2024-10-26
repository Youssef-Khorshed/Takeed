import 'package:flutter/material.dart';
import 'package:takeed/Features/home/Offers/offerPageDetails.dart';

class OffersPage extends StatelessWidget {
  final List<FlightOffer> offers = [
    FlightOffer("Flight to New York", "200 USD", "Best offer for New York."),
    FlightOffer("Flight to London", "300 USD", "Visit the UK with this offer."),
    FlightOffer("Flight to Tokyo", "400 USD", "Experience Japan."),
  ];

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
          return ListTile(
            title: Text(offers[index].title),
            subtitle: Text(offers[index].price),
            onTap: () {
              Navigator.of(context).push(_createRoute(offers[index]));
            },
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
