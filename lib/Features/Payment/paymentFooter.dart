// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moyasar/moyasar.dart';

import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/button/button2.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class Paymentfooter extends StatelessWidget {
  CardFormModel cardFormModel;
  double amount;
  Paymentfooter({
    super.key,
    required this.cardFormModel,
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
                  }),
              SizedBox(
                height: 13.w,
              ),
              OutlinedTextButton(
                  buttonText: 'Cancel',
                  buttonWidth: 296.w,
                  buttonHeight: 56.h,
                  textStyle: TextStyles.font18orangeRegular,
                  onPressed: () async {
                    final paymentConfig = PaymentConfig(
                      publishableApiKey:
                          'pk_test_3XNnbvssL1F9oQbd2THeavNshC8WRiW6uUwyTq1T',
                      amount: amount.round(),
                      description: 'order #1324',
                      metadata: {'size': '250g'},
                      creditCard:
                          CreditCardConfig(saveCard: false, manual: false),
                    );
                    final request = CardPaymentRequestSource(
                        creditCardData: cardFormModel,
                        tokenizeCard: false,
                        manualPayment: false);
                    final res = await Moyasar.pay(
                        apiKey:
                            'pk_test_3XNnbvssL1F9oQbd2THeavNshC8WRiW6uUwyTq1T',
                        paymentRequest: PaymentRequest(paymentConfig, request));
                    debugPrint(res);
                  }),
            ],
          ),
        ],
      ),
    ]);
  }
}
