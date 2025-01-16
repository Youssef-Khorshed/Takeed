// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/contact.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/name.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/phone.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/Flight/FlightDetails/documentsDetails.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/text_box/authTextfield.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';
import 'package:takeed/core/Validation/check_emptyText.dart';
import '../../BottomNavigation/Home/Data/Model/traveller/traveller.dart';

// ignore: must_be_immutable
class TravellerForm extends StatefulWidget {
  const TravellerForm({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TravellerFormState createState() => _TravellerFormState();
}

class _TravellerFormState extends State<TravellerForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String _gender = 'MALE';
  List<Phone> phones = [];
  String _countryCode = 'RUH';

  @override
  void initState() {
    super.initState();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final trav = context.read<FlightCubit>().travellers;
      phones.add(Phone(
        deviceType: Checktext.getDeviceType(),
        countryCallingCode: _countryCode,
        number: _phoneController.text,
      ));
      final traveller = Traveller(
        id: (trav.length + 1).toString(),
        contact: Contact(
          phones: phones,
          emailAddress: _emailController.text,
        ),
        name: Name(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
        ),
        dateOfBirth: _dobController.text,
        gender: _gender,
      );
      trav.add(traveller);
      Navigator.pop(context);
      showBottomSheet(
          context: context,
          builder: (context) => Documentsdetails(
                country: _countryCode,
              ));
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
              AppTextFormField(
                controller: _firstNameController,
                hintText: 'First Name',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'First Name');
                },
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _lastNameController,
                hintText: 'Last Name',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'Last Name');
                },
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _dobController,
                hintText: 'Birth Date',
                validator: Checktext.birthDateValidation,
              ),
              SizedBox(height: 20.h),
              DropdownButtonFormField<String>(
                value: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                items: ['MALE', 'FEMALE', 'OTHER']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _emailController,
                hintText: 'Email',
                validator: Checktext.emailValidation,
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: _phoneController,
                preifxwidget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CountryListPick(
                        theme:
                            CountryTheme(isShowTitle: false, isShowCode: false),
                        initialSelection: _countryCode,
                        onChanged: (value) {
                          setState(() {
                            _countryCode = value!.code!;
                          });
                        }),
                    Container(
                      width: 2.w,
                      height: 24.h,
                      color: ColorManager.GrayColor2,
                    ),
                  ],
                ),
                hintText: '  Your number',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'number');
                },
              ),
              SizedBox(height: 20.h),
              AppTextButton(
                  buttonHeight: 56.h,
                  buttonWidth: 250.w,
                  buttonText: 'Next',
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
