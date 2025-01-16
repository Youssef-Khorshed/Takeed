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
            title: const Text('Add Travelers Information'),
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
                          final cubit = context.read<FlightCubit>();
                          if (cubit.travellers.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please add travelers Details'),
                              ),
                            );
                          } else if (cubit.travellers.length ==
                              cubit.getTravelersCount.length) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please confirm the trip'),
                              ),
                            );
                          } else {
                            cubit.createFlightOrder(
                                address: cubit.address,
                                flightRequest: flightSearchData,
                                travelers: cubit.travellers);
                          }
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
                  if (x.travellers.length == element.value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please confirm the trip'),
                      ),
                    );
                  } else {
                    showBottomSheet(
                        context: context,
                        builder: (context) {
                          return const SizedBox(child: TravellerForm());
                        });
                  }

                  debugPrint((element.value).toString());
                  debugPrint((x.travellers.length).toString());
                },
                title: Text(element.key),
                trailing: Text('${index + 1}'),
              );
            });
          } else {
            return [const SizedBox()];
          }
        }).toList());
  }
}
