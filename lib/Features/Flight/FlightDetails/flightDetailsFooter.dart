// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/Flight/FlightDetails/travellerDetails.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/button/button2.dart';
import 'package:takeed/core/Routes/routes.dart';

import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class Flightdetailsfooter extends StatelessWidget {
  FlightOfferFromPricing flightSearchData;
  Flightdetailsfooter({
    super.key,
    required this.flightSearchData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
            title: const Text('Add Travelers Information'), //
            //

            children: <Widget>[
              buildTravelers(context: context),
            ]),
        SizedBox(
          height: 15.w,
        ),
        context.watch<FlightCubit>().state is FlightLoading
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedTextButton(
                        buttonText: 'Cancel',
                        buttonWidth: 156.w,
                        buttonHeight: 56.h,
                        textStyle: TextStyles.font18orangeRegular,
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.bottomnavigation);
                        }),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: AppTextButton(
                        buttonHeight: 56.h,
                        buttonWidth: 156.w,
                        buttonText: 'Confirm',
                        textStyle: TextStyles.font18WhiteRegular,
                        onPressed: () {
                          context.read<FlightCubit>().createFlightOrder(
                              flightRequest: flightSearchData,
                              travelers:
                                  context.read<FlightCubit>().travellers);
                        }),
                  ),
                ],
              ),
      ],
    );
  }

  buildTravelers({required BuildContext context}) {
    final x = context.read<FlightCubit>();
    final travelers = x.getTravelersCount;

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: travelers.entries.expand((element) {
          if (element.value >= 1) {
            return List.generate(element.value, (index) {
              return ListTile(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                            child: TravellerForm(
                                onSubmit: (traveller) => context
                                    .read<FlightCubit>()
                                    .travellers
                                    .add(traveller)));
                      });
                },
                title: Text(element.key),
                trailing: Text('${index + 1}'),
              );
            });
          } else {
            return [
              const SizedBox()
              // ListTile(
              //   title: Text(element.key),
              //   trailing: Text('${element.value}'),
              // ),
            ];
          }
        }).toList());
  }
}
