// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/address.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/Flight/FlightDetails/IDPassword.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/text_box/authTextfield.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';
import 'package:takeed/core/Validation/check_emptyText.dart';

// ignore: must_be_immutable
class Documentsdetails extends StatefulWidget {
  const Documentsdetails({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DocumentsdetailsState createState() => _DocumentsdetailsState();
}

class _DocumentsdetailsState extends State<Documentsdetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _linesController = TextEditingController();
  final TextEditingController _postalcodeController = TextEditingController();
  final TextEditingController _countrycodeController = TextEditingController();
  final TextEditingController _citynameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<FlightCubit>().addTravellerAddress(
              travelleraddress: Address(
            lines: [_linesController.text],
            postalCode: _postalcodeController.text,
            cityName: _citynameController.text,
            countryCode: _countrycodeController.text,
          ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              IDPassportRadioButton(onselectedvalue: (onselectedvalue) {}),
              AppTextFormField(
                controller: _linesController,
                hintText: 'Lines',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'First Name');
                },
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _postalcodeController,
                hintText: 'Postal code',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'Postal code');
                },
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _citynameController,
                hintText: 'City Name',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'City Name');
                },
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _countrycodeController,
                hintText: 'Country Code',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'Country Code');
                },
              ),
              SizedBox(height: 20.h),
              AppTextButton(
                  buttonHeight: 56.h,
                  buttonWidth: 250.w,
                  buttonText: 'Confirm',
                  textStyle: TextStyles.font18WhiteRegular,
                  onPressed: _submitForm),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
