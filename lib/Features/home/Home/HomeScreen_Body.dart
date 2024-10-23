import 'package:flutter/material.dart';
import 'package:takeed/Features/home/Home/Carosaloffers.dart';
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
        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Hot Offers',
              style: TextStyles.font18BlackBold,
            ),
            Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyles.font14orangeRegular,
                ))
          ],
        ),
        OfferCarousel()
      ],
    );
  }

  void _onSearch() {
    context.pushNamed(Routes.search);
  }

  Widget _buildSearchButton() {
    return AppTextButton(
        buttonText: 'Search',
        textStyle: TextStyles.font14WhiteRegular,
        onPressed: _onSearch);
  }
}
