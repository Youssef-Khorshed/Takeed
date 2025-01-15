// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moyasar/moyasar.dart';

class PaymentMethods extends StatelessWidget {
  int amount;
  PaymentMethods({
    super.key,
    required this.amount,
  });

  PaymentConfig paymentConfig = PaymentConfig(
    publishableApiKey: 'pk_test_3XNnbvssL1F9oQbd2THeavNshC8WRiW6uUwyTq1T',
    amount: 62500, // SAR 257.58
    description: 'Buy A new Ticket',
    metadata: {'description': 'A new Ticket'},
    creditCard: CreditCardConfig(saveCard: true, manual: false),
    applePay: ApplePayConfig(
        merchantId: 'YOUR_MERCHANT_ID',
        label: 'YOUR_STORE_NAME',
        manual: false),
  );

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
            onPaymentResult: onPaymentResult,
          )
        ],
      ),
    );
  }

  bool onPaymentResult(result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          return true;
          break;
        case PaymentStatus.failed:
          // handle failure.
          return false;
        default:
          // handle other cases.
          return false;
          break;
      }
    }
    return false;
  }
}
