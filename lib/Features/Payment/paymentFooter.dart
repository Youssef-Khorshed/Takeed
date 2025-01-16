// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moyasar/moyasar.dart';

import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/Payment/moyaser.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/button/button2.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class Paymentfooter extends StatelessWidget {
  CreateFlightOrder createFlightOrder;
  int amount;
  Paymentfooter({
    super.key,
    required this.createFlightOrder,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset('assets/images/paymentcards.png'),
      SizedBox(height: 35.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              AppTextButton(
                  buttonHeight: 56.h,
                  buttonWidth: 296.w,
                  buttonText: 'Confirm',
                  textStyle: TextStyles.font18WhiteRegular,
                  onPressed: () {
                    //  context.pushNamed(Routes.boardingPass);
                    showBottomSheet(
                        context: context,
                        builder: (builder) => PaymentMethods(
                              offers: createFlightOrder,
                              paymentConfig: PaymentConfig(
                                publishableApiKey:
                                    'pk_test_3XNnbvssL1F9oQbd2THeavNshC8WRiW6uUwyTq1T',
                                amount: amount.toInt(),
                                description: 'Buy A new Ticket',
                                metadata: {'description': 'A new Ticket'},
                                creditCard: CreditCardConfig(
                                    saveCard: true, manual: false),
                                applePay: ApplePayConfig(
                                    merchantId: 'YOUR_MERCHANT_ID',
                                    label: 'YOUR_STORE_NAME',
                                    manual: false),
                              ),
                            ));
                  }),
              SizedBox(
                height: 13.w,
              ),
              OutlinedTextButton(
                  buttonText: 'Cancel',
                  buttonWidth: 296.w,
                  buttonHeight: 56.h,
                  textStyle: TextStyles.font18orangeRegular,
                  onPressed: () async {}),
            ],
          ),
        ],
      ),
    ]);
  }

  int convertStringToInt(String str) {
    try {
      str = str.trim(); // Remove leading/trailing whitespaces
      str = str.replaceAll(
          ',', '.'); // Replace commas with periods (if necessary)
      double num = double.parse(str);
      return num.toInt();
    } catch (e) {
      throw FormatException("Invalid number format: $str");
    }
  }
}
