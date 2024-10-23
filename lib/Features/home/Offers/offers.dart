import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  final List<FlightOffer> offers = [
    FlightOffer("Flight to New York", "200 USD", "Best offer for New York."),
    FlightOffer("Flight to London", "300 USD", "Visit the UK with this offer."),
    FlightOffer("Flight to Tokyo", "400 USD", "Experience Japan."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flight Offers')),
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

class OfferDetailPage extends StatelessWidget {
  final FlightOffer offer;

  OfferDetailPage({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(offer.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(offer.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Price: ${offer.price}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(offer.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class FlightOffer {
  final String title;
  final String price;
  final String description;

  FlightOffer(this.title, this.price, this.description);
}
