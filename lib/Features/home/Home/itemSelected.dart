import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/LabelItem/labelItem.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class ItemSelected extends StatefulWidget {
  const ItemSelected({super.key});

  @override
  State<ItemSelected> createState() => _ItemSelectedState();
}

class _ItemSelectedState extends State<ItemSelected> {
  final String _classType = 'Economy';
  bool _switchValue = true;
  int travellers = 0;
  String classType = 'Economy';
  CounterRow adult = CounterRow(label: 'Adult', counter: 0);
  CounterRow child = CounterRow(label: 'Child', counter: 0);
  CounterRow baby = CounterRow(label: 'Baby', counter: 0);
  int get getTravellers => travellers;
  String get getClassType => _classType;
  @override
  Widget build(BuildContext context) {
    return _switchValue
        ? GestureDetector(
            onTap: () => setState(() => _switchValue = !_switchValue),
            child: buildDropdownSelectors(
                travellers: travellers, classType: classType),
          )
        : Card(
            color: Colors.white,
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  adult,
                  child,
                  baby,
                  AppTextButton(
                      buttonText: 'OK',
                      buttonWidth: 20,
                      buttonHeight: 20,
                      textStyle: TextStyles.font14WhiteRegular,
                      onPressed: () {
                        travellers = adult.getCounter +
                            child.getCounter +
                            baby.getCounter;
                        setState(() => _switchValue = !_switchValue);
                      })
                ],
              ),
            ),
          );
  }

  Widget buildDropdownSelectors(
      {required int travellers, required String classType}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Labelitem(
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
        SizedBox(width: 16.w),
        Expanded(
          child: Labelitem(
            label: 'Class',
            labelStyle: TextStyles.font10RegularDarkGray,
            containerheight: 75.h,
            child: Container(
              padding: const EdgeInsetsDirectional.all(5),
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ColorManager.GrayColor)),
              child: DropdownButtonFormField<String>(
                value: classType,
                decoration: const InputDecoration(border: InputBorder.none),
                items: ['Economy', 'Business', 'Special', 'Premium Economy']
                    .map((classType) => DropdownMenuItem(
                        value: classType, child: Text(classType)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    classType = value!;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CounterRow extends StatefulWidget {
  final String label;
  int counter;
  int get getCounter => counter;

  CounterRow({super.key, required this.label, required this.counter});

  @override
  _CounterRowState createState() => _CounterRowState();
}

class _CounterRowState extends State<CounterRow> {
  void increment() {
    setState(() {
      widget.counter++;
    });
  }

  void decrement() {
    if (widget.counter > 0) {
      setState(() {
        widget.counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: increment,
        ),
        Text('${widget.counter}', style: const TextStyle(fontSize: 18)),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: decrement,
        ),
      ],
    );
  }
}
