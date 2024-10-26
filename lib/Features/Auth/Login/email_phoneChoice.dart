import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Auth/Logic/LoginCubit/logincubit.dart';
import 'package:takeed/components/text_box/authTextfield.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Validation/check_emptyText.dart';

class ToggleEmailPhone extends StatefulWidget {
  String? selectedChoice;
  ToggleEmailPhone({Key? key, this.selectedChoice}) : super(key: key);

  @override
  State<ToggleEmailPhone> createState() => _ToggleEmailPhoneState();
}

class _ToggleEmailPhoneState extends State<ToggleEmailPhone> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ChoiceChip(
            //   label: selectedChoice == 'Email'
            //       ? Text('Email')
            //       : Container(
            //           child: Text('data'),
            //         ),
            //   labelStyle: TextStyles.font14BlackRegular,
            //   backgroundColor: Colors.white,
            //   selectedColor: Colors.white,
            //   side: const BorderSide(
            //     color: Colors.transparent,
            //     width: 2,
            //   ),
            //   selected: selectedChoice == 'Email',
            //   showCheckmark: false,
            //   onSelected: (isSelected) {
            //     setState(() {
            //       selectedChoice = isSelected ? 'Email' : null;
            //     });
            //   },
            // ),

            _buildChoiceChip('Email', context),

            SizedBox(width: 16.w),
            _buildChoiceChip('Phone', context),
            // ChoiceChip(
            //   label: Text('Phone Number'),
            //   labelStyle: TextStyles.font14BlackRegular,
            //   backgroundColor: Colors.white,
            //   selectedColor: Colors.white,
            //   side: const BorderSide(
            //     color: Colors.transparent,
            //     width: 2,
            //   ),
            //   showCheckmark: false,
            //   selected: selectedChoice == 'Phone Number',
            //   onSelected: (isSelected) {
            //     setState(() {
            //       selectedChoice = isSelected ? 'Phone Number' : null;
            //     });
            //   },
            // ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        widget.selectedChoice == 'Email'
            ? AppTextFormField(
                // controller: loginEmailcontroller,s
                hintText: 'Email',
                validator: (value) {
                  return Checktext.validateEmptyText(value, 'email');
                },
              )
            : AppTextFormField(
                // controller: phoneController,
                preifxwidget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CountryListPick(
                        theme:
                            CountryTheme(isShowTitle: false, isShowCode: false),
                        initialSelection: '+20',
                        onChanged: (value) {}),
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
      ],
    );
  }

  Widget _buildChoiceChip(String title, BuildContext context) {
    bool isSelected =
        widget.selectedChoice == title; //check for selected first time

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedChoice = isSelected ? null : title; // Toggle selection
          context.read<Logincubit>().selectEmailOrPhoneLogin(selected: title);
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              height: 2,
              width: 60, // Adjust the width as needed
              color: ColorManager.primaryOrnage,
            ),
        ],
      ),
    );
  }
}
