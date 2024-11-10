import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/components/LabelItem/labelItem.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class ItemSelected extends StatefulWidget {
  ItemSelected({super.key});

  @override
  State<ItemSelected> createState() => _ItemSelectedState();
}

class _ItemSelectedState extends State<ItemSelected> {
  bool _switchValue = true;
  int travellers = 0;
  CounterRow adult = CounterRow(
    label: 'Adults',
  );
  CounterRow child = CounterRow(label: 'Children');
  CounterRow baby = CounterRow(label: 'Infants');
  String classType = 'Economy';
  int get getTravellers => travellers;

  @override
  Widget build(BuildContext context) {
    return _switchValue
        ? GestureDetector(
            onTap: () => setState(() => _switchValue = !_switchValue),
            child: buildDropdownSelectors(travellers: travellers),
          )
        : Card(
            color: Colors.white,
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  adult,
                  child,
                  baby,
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            travellers =
                                context.read<FlightCubit>().countTravelers();
                            if (travellers == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please select at least 1 traveller')),
                              );
                            } else {
                              setState(() => _switchValue = !_switchValue);
                            }
                            ;
                          },
                          child: Text(
                            'OK',
                            style: TextStyles.font18orangeRegular,
                          )),
                      TextButton(
                          onPressed: () {
                            travellers =
                                context.read<FlightCubit>().countTravelers();

                            setState(() => _switchValue = !_switchValue);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyles.font18orangeRegular,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  Widget buildDropdownSelectors({required int travellers}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Labelitem(
            label: 'Travellers',
            labelStyle: TextStyles.font10RegularDarkGray,
            containerheight: 75.h,
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(vertical: 15.w),
              height: 60.h,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ColorManager.GrayColor)),
              child: Text(travellers == 0 ? 'Select Travellers' : '$travellers',
                  textAlign: TextAlign.center,
                  style: travellers == 0
                      ? TextStyles.font14BlackRegular
                      : TextStyles.font16BlackRegular),
            ),
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Labelitem(
            label: 'Class',
            labelStyle: TextStyles.font10RegularDarkGray,
            containerheight: 75.h,
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              height: 60.h,
              width: 150.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ColorManager.GrayColor)),
              child: DropdownButtonFormField<String>(
                icon: const SizedBox(),
                isExpanded: true,
                value: context.read<FlightCubit>().classType,
                decoration: const InputDecoration(border: InputBorder.none),
                items: ['Economy', 'Business', 'Special', 'Premium']
                    .map((classType) => DropdownMenuItem(
                        value: classType, child: Text(classType)))
                    .toList(),
                onChanged: (value) {
                  context.read<FlightCubit>().setClassType(type: value!);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CounterRow extends StatelessWidget {
  final String label;

  CounterRow({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 18)),
          const Spacer(),
          InkWell(
            onTap: () =>
                context.read<FlightCubit>().decrementTravelrCount(label: label),
            child: Image.asset('assets/images/home/subtract.png',
                width: 20.w, height: 20.h),
          ),
          SizedBox(width: 20.w),
          Text('${context.watch<FlightCubit>().getTravelersCount[label] ?? 0}',
              style: const TextStyle(fontSize: 18)),
          SizedBox(width: 20.w),
          InkWell(
            onTap: () =>
                context.read<FlightCubit>().incrementTravelrCount(label: label),
            child: Image.asset('assets/images/home/additem.png',
                width: 20.w, height: 20.h),
          ),
        ],
      ),
    );
  }
}
