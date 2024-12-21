import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/Carosaloffers.dart';
import 'package:takeed/components/button/button.dart';
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
          ],
        ),
        SizedBox(height: 12.h),
        const OfferCarousel()
      ],
    );
  }

  void _onSearch() async {
    final flight = context.read<FlightCubit>();
    if (flight.formKey.currentState!.validate()) {
      await flight.getSearchedFlights(
          // required String
          originLocationCode: flight.fromairport.cityCode ?? 'CAI',
          destinationLocationCode: flight.toairport.cityCode ?? "RUH",
          // required String
          departureDate:
              '${flight.departureDate.year}-${flight.departureDate.month}-${flight.departureDate.day}',
          // not null
          returnDate: flight.returnDate == null
              ? ''
              : '${flight.returnDate!.day}-${flight.returnDate!.month}-${flight.returnDate!.year}',
          // required String
          adults: flight.getTravelersCount['Adults']!.toString(),
          children: flight.getTravelersCount['Children']!.toString(),
          infants: flight.getTravelersCount['Infants']!.toString(),
          // const String
          currencyCode: flight.currencyCode.first,
          max: '250');
    }
  }

  Widget _buildSearchButton() {
    return AppTextButton(
        buttonText: 'Search',
        textStyle: TextStyles.font14WhiteRegular,
        onPressed: () {
          _onSearch();
        });
  }
}
