import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Payment/paymentBody.dart';
import 'package:takeed/Features/Payment/paymentFooter.dart';
import 'package:takeed/components/Flight/flightTicketRow.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/button/button2.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Paymentbody(), SizedBox(height: 20.h), Paymentfooter()],
          ),
        ),
      ),
    );
  }
}
