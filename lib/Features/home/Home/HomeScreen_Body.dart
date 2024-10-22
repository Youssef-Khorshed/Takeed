import 'package:flutter/material.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class HomescreenBody extends StatefulWidget {
  const HomescreenBody({super.key});

  @override
  State<HomescreenBody> createState() => _HomescreenBodyState();
}

class _HomescreenBodyState extends State<HomescreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: _buildSearchButton()),
        SizedBox(height: 24),
        Divider(),
        SizedBox(height: 8),
        _buildHotOffersSection(),
      ],
    );
  }

  void _onSearch() {
    context.pushNamed(Routes.search);
  }

  Widget _buildHotOffersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hot offers',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildOfferCard(
                  discount: '15% OFF',
                  description: '15% discount with Mastercard'),
              _buildOfferCard(
                  discount: '23% OFF', description: 'Visa offer description'),
              // Add more offers as needed
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchButton() {
    return AppTextButton(
        buttonText: 'Search',
        textStyle: TextStyles.font14WhiteRegular,
        onPressed: _onSearch);
  }

  Widget _buildOfferCard(
      {required String discount, required String description}) {
    return Card(
      margin: EdgeInsets.only(right: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 160,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(discount,
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
