import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OfferCarousel extends StatefulWidget {
  @override
  State<OfferCarousel> createState() => _OfferCarouselState();
}

class _OfferCarouselState extends State<OfferCarousel> {
  final List<Widget> offers = [];
  @override
  void initState() {
    offers.add(
      _buildOfferCard(
          discount: '15% OFF', description: '15% discount with Mastercard'),
    );
    offers.add(
      _buildOfferCard(
          discount: '10% OFF', description: '10% discount with Google Pay'),
    );
    offers.add(
      _buildOfferCard(
          discount: '20% OFF', description: '20% discount with Amazon Pay'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 100.0,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          onPageChanged: (index, reason) {
            // Optional: handle page change
          },
        ),
        items: offers.map((offer) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: offer,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  // Widget _buildHotOffersSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Hot offers',
  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 8),
  //       SizedBox(
  //         height: 100,
  //         child: ListView(
  //           scrollDirection: Axis.horizontal,
  //           children: [
  //             // Add more offers as needed
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildOfferCard(
      {required String discount, required String description}) {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(discount,
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
