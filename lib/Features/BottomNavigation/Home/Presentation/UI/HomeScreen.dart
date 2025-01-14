// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/buildFromCity.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/buildToCity.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/HomeScreen_Body.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/drawer.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/itemSelected.dart';
import 'package:takeed/components/LabelItem/labelItem.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  bool showINsheet = true;

  Homescreen({super.key, this.showINsheet = true});

  @override
  // ignore: library_private_types_in_public_api
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String _tripType = 'One way';
  bool _swap = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightCubit, FlightState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.homescreenBackgroundColor,
          drawer: buildDrawer(context: context),
          appBar: AppBar(
            title: const Text('Book Flight'),
            centerTitle: true,
            automaticallyImplyLeading: widget.showINsheet,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: context.read<FlightCubit>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTripTypeSelector(),
                    SizedBox(height: 8.h),
                    oneWay(context: context),
                    widget.showINsheet ? const HomescreenBody() : Container()
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
    return BlocBuilder<FlightCubit, FlightState>(
      builder: (context, state) {
        final flight = context.watch<FlightCubit>();

        return Row(
          children: [
            Expanded(
              child: Labelitem(
                label: 'Departure',
                labelStyle: TextStyles.font12RegularDarkGray,
                containerheight: 70,
                child: _buildDateInput(
                    label: flight.pickdepartureDateFirstTime == false
                        ? ''
                        : '${flight.departureDate.day}/${flight.departureDate.month}/${flight.departureDate.year}',
                    date: flight.departureDate,
                    onTap: () => context
                        .read<FlightCubit>()
                        .selectDate(context, isDeparture: true)),
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
                      label: flight.pickReturnDateFirstTime == false
                          ? ''
                          : '${flight.returnDate!.day}/${flight.returnDate!.month}/${flight.returnDate!.year}',
                      date: flight.returnDate,
                      prefixIcon: _tripType == 'Round'
                          ? Icons.date_range
                          : Icons.add_box_outlined,
                      onTap: () => _goToRound(),
                    ),
                  ))
                : Container(),
          ],
        );
      },
    );
  }

  void _goToRound() {
    setState(() {
      _tripType == 'Round'
          ? context.read<FlightCubit>().selectDate(context, isDeparture: false)
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

  Widget oneWay({required BuildContext context}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            _swap
                ? const Column(
                    children: [
                      BuildFromCity(
                        label: 'Form',
                        icon: Icons.flight_takeoff,
                      ),
                      BuildToCity(
                        label: 'To',
                        icon: Icons.flight_land,
                      )
                    ],
                  )
                : const Column(
                    children: [
                      BuildToCity(
                        label: 'To',
                        icon: Icons.flight_land,
                      ),
                      BuildFromCity(
                        label: 'From',
                        icon: Icons.flight_takeoff,
                      )
                    ],
                  ),
            Positioned(
              right: 30.w,
              child: InkWell(
                  onTap: () => setState(() {
                        _swap = !_swap;
                      }),
                  child: Image.asset(
                    'assets/images/home/swap.png',
                    width: 40.w,
                    height: 40.h,
                  )),
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
}
