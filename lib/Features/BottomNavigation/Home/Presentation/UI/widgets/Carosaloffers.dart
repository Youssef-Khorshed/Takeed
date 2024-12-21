import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCarousel extends StatefulWidget {
  const OfferCarousel({super.key});

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
          height: 130.0,
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
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
      color: Colors.white,
      elevation: 4,
      child: Container(
        width: 160.w,
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/offer.png'),
            SizedBox(width: 10.w),
            const Column(
              children: [
                Text('Flight to New York',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('"200 USD"', style: TextStyle(fontSize: 10)),
                SizedBox(height: 10),
                Text('Best offer for New York.',
                    style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
