// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/document.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/Flight/FlightDetails/IDPassword.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/text_box/authTextfield.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';
import 'package:takeed/core/Validation/check_emptyText.dart';

// ignore: must_be_immutable
class Documentsdetails extends StatefulWidget {
  String country;
  Documentsdetails({
    super.key,
    required this.country,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DocumentsdetailsState createState() => _DocumentsdetailsState();
}

class _DocumentsdetailsState extends State<Documentsdetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _birthPlaceController = TextEditingController();
  final TextEditingController _issuanceLocationController =
      TextEditingController();
  final TextEditingController _issuanceDateController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  String _documentType = 'ID';

  @override
  void initState() {
    super.initState();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<FlightCubit>().addTravellerDocument(
              travellerdocument: Document(
            documentType: _documentType,
            birthPlace: _birthPlaceController.text,
            issuanceLocation: _issuanceLocationController.text,
            issuanceDate: _issuanceDateController.text,
            expiryDate: _expiryDateController.text,
            number: _numberController.text,
            holder: true,
            issuanceCountry: widget.country,
            validityCountry: widget.country,
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
              IDPassportRadioButton(onselectedvalue: (onselectedvalue) {
                setState(() {
                  _documentType = onselectedvalue;
                });
              }),
              AppTextFormField(
                controller: _birthPlaceController,
                hintText: 'Birth Place',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'Birth Place');
                },
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _issuanceLocationController,
                hintText: 'Issuance Location',
                validator: (value) {
                  return Checktext.validateEmptyText(
                      value, 'Issuance Location');
                },
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _issuanceDateController,
                hintText: 'Issuance Date',
                validator: Checktext.birthDateValidation,
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                  controller: _expiryDateController,
                  hintText: 'Expiry Date',
                  validator: Checktext.birthDateValidation),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _numberController,
                hintText: 'ID Number',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'ID Number');
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
