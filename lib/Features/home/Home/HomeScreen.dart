import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Theme/themecubit.dart';
import 'package:takeed/Features/home/Home/HomeScreen_Body.dart';
import 'package:takeed/Features/home/Home/buildCity.dart';
import 'package:takeed/Features/home/Home/drawer.dart';
import 'package:takeed/Features/home/Home/itemSelected.dart';
import 'package:takeed/components/LabelItem/labelItem.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Routes/app_routes.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Homescreen extends StatefulWidget {
  bool showINsheet = true;

  Homescreen({super.key, this.showINsheet = true});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String _tripType = 'One way';
  final String _fromCity = 'Delhi';
  final String _toCity = 'Kolkata';
  DateTime _departureDate = DateTime.now();
  DateTime? _returnDate;
  final int _adults = 1;
  final String _classType = 'Economy';
  bool __PickdepartureDateFirstTime = false;
  bool __PickReturnDateFirstTime = false;
  bool _swap = true;
  TextEditingController fromCityController = TextEditingController();
  TextEditingController toCityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themcubit = context.watch<ThemeCubit>();
    return Scaffold(
      backgroundColor: ColorManager.homescreenBackgroundColor,
      drawer: buildDrawer(context: context, themcubit: themcubit),
      appBar: AppBar(
        title: const Text('Book Flight'),
        centerTitle: true,
        automaticallyImplyLeading: widget.showINsheet,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTripTypeSelector(),
              SizedBox(height: 8.h),
              _OneWay(context: context),
              widget.showINsheet ? const HomescreenBody() : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripTypeSelector() {
    final tripTypes = ['One way', 'Round'];

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Card(
        elevation: 2,
        child: Container(
          height: 36.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tripTypes.map((type) {
              final isSelected = _tripType == type;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _tripType = type;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ColorManager.primaryOrnage
                            : Colors.white,
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: isSelected
                              ? Colors.white
                              : ColorManager.DarkGrayColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelectors() {
    return Row(
      children: [
        Expanded(
          child: Labelitem(
            label: 'Departure',
            labelStyle: TextStyles.font12RegularDarkGray,
            containerheight: 70,
            child: _buildDateInput(
              label: __PickdepartureDateFirstTime == false
                  ? ''
                  : '${_departureDate.day}/${_departureDate.month}/${_departureDate.year}',
              date: _departureDate,
              onTap: () => _selectDate(context, isDeparture: true),
            ),
          ),
        ),
        _tripType == 'Round' ? SizedBox(width: 16.w) : Container(),
        _tripType == 'Round'
            ? Expanded(
                child: Labelitem(
                label: 'Return',
                labelStyle: TextStyles.font12RegularDarkGray,
                containerheight: 70,
                child: _buildDateInput(
                  label: __PickReturnDateFirstTime == false
                      ? ''
                      : '${_departureDate.day}/${_departureDate.month}/${_departureDate.year}',
                  date: _returnDate,
                  prefixIcon: _tripType == 'Round'
                      ? Icons.date_range
                      : Icons.add_box_outlined,
                  onTap: () => _goToRound(),
                ),
              ))
            : Container(),
      ],
    );
  }

  void _goToRound() {
    setState(() {
      _tripType == 'Round'
          ? _selectDate(context, isDeparture: false)
          : _tripType = 'Round';
    });
  }

  Widget _buildDateInput(
      {required String label,
      DateTime? date,
      required VoidCallback onTap,
      IconData? prefixIcon}) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            hintText: date != null
                ? '${date.day}/${date.month}/${date.year}'
                : '+ Add Return Date',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            prefixIcon: Icon(
              prefixIcon ?? Icons.date_range,
            ),
          ),
        ),
      ),
    );
  }

  Widget _OneWay({required BuildContext context}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            _swap
                ? Column(
                    children: [
                      BuildCity(
                          label: 'Form',
                          icon: Icons.flight_takeoff,
                          controller: fromCityController),
                      BuildCity(
                          label: 'To',
                          icon: Icons.flight_land,
                          controller: toCityController)
                    ],
                  )
                : Column(
                    children: [
                      BuildCity(
                          label: 'To',
                          icon: Icons.flight_land,
                          controller: toCityController),
                      BuildCity(
                          label: 'From',
                          icon: Icons.flight_takeoff,
                          controller: fromCityController)
                    ],
                  ),
            Positioned(
              right: 30.w,
              child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _swap = !_swap;
                        });
                      },
                      icon: const Icon(Icons.thumbs_up_down_outlined))),
            )
          ],
        ),
        SizedBox(height: 10.h),
        _buildDateSelectors(),
        SizedBox(height: 10.h),
        const ItemSelected(),
        SizedBox(height: 10.h),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context,
      {required bool isDeparture}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isDeparture ? _departureDate : _returnDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        if (isDeparture) {
          _departureDate = pickedDate;
          __PickdepartureDateFirstTime = true;

          print(__PickReturnDateFirstTime);
        } else {
          _returnDate = pickedDate;
          __PickReturnDateFirstTime = true;
        }
      });
    }
  }
}
