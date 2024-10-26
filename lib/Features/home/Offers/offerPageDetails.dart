import 'package:flutter/material.dart';

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
