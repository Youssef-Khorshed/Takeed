import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferDetailPage extends StatelessWidget {
  final FlightOffer offer;

  const OfferDetailPage({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(offer.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                    Text(offer.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text('Price: ${offer.price}',
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text(offer.description,
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
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
