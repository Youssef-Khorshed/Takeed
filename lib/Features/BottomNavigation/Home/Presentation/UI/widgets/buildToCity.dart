import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class BuildToCity extends StatefulWidget {
  final String label;
  final IconData icon;
  const BuildToCity({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  State<BuildToCity> createState() => _BuildToCityState();
}

class _BuildToCityState extends State<BuildToCity> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = context.read<FlightCubit>().toCityController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter valid city name';
              }
              return null;
            },
            controller: controller,
            onChanged: (query) {
              setState(() {
                controller.text = query;
              });
              context.read<FlightCubit>().fetchAirplanesToSuggestions(
                    keyword: query,
                  );
            },
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: TextStyles.font14GrayRegular,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: ColorManager.primaryOrnage,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: ColorManager.primaryOrnage,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: ColorManager.GrayColor,
                  )),
              prefixIcon: Icon(
                widget.icon,
              ),
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      onPressed: () => setState(() {
                            controller.clear();
                            context.read<FlightCubit>().clearlist(
                                airportType:
                                    context.read<FlightCubit>().toAirports);
                          }),
                      icon: const Icon(Icons.close_rounded))
                  : null,
            ),
          ),
          BlocBuilder<FlightCubit, FlightState>(
            builder: (context, state) {
              final flight = context.watch<FlightCubit>();
              if (state is GetToAirportsResult) {
                return SizedBox(
                  height: flight.toAirports.isEmpty ? 0 : 300.h,
                  child: ListView.builder(
                    itemCount: flight.toAirports.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(flight.toAirports[index].cityName!),
                        subtitle: Text(flight.toAirports[index].countryName!),
                        leading: const Icon(Icons.flight_takeoff),
                        onTap: () {
                          controller.text = flight.toAirports[index].cityName!;
                          context.read<FlightCubit>().toairport =
                              flight.toAirports[index];
                          context.read<FlightCubit>().clearlist(
                              airportType:
                                  context.read<FlightCubit>().toAirports);
                        },
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
