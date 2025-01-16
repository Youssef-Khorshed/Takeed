// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moyasar/moyasar.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';

class PaymentMethods extends StatelessWidget {
  final PaymentConfig paymentConfig;
  final CreateFlightOrder offers;
  const PaymentMethods({
    super.key,
    required this.paymentConfig,
    required this.offers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 50.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ApplePay(
            config: paymentConfig,
            onPaymentResult: onPaymentResult,
          ),
          SizedBox(
            height: 10.h,
          ),
          const Text("or"),
          CreditCard(
            config: paymentConfig,
            onPaymentResult: (result) {
              onPaymentResult(result, context: context);
            },
          )
        ],
      ),
    );
  }

  bool onPaymentResult(result, {required BuildContext context}) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          result.id;
          context.read<FlightCubit>().confirmPayment(
              reservationGUID: offers.reservationGuid!, payemntId: result.id);
          //  context.pushNamed(Routes.boardingPass, arguments: offers);
          return true;
        case PaymentStatus.failed:
          // handle failure.
          return false;
        default:
          // handle other cases.
          return false;
      }
    }
    return false;
  }
}
