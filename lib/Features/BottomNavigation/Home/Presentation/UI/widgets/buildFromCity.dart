import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/loadingShimmer.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';
import 'package:shimmer/shimmer.dart';

class BuildFromCity extends StatefulWidget {
  final String label;
  final IconData icon;
  const BuildFromCity({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  State<BuildFromCity> createState() => _BuildFromCityState();
}

class _BuildFromCityState extends State<BuildFromCity> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = context.read<FlightCubit>().fromCityController;
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
            onChanged: (query) async {
              setState(() {
                controller.text = query;
              });
              context.read<FlightCubit>().fetchAirplanesFromSuggestions(
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
              if (state is LoadingText) {
                return SizedBox(
                    height: flight.fromairports.isEmpty ? 0 : 300.h,
                    child: buildShimmersearchList());
              }
              if (state is GetFromAirportsResult) {
                return SizedBox(
                  height: flight.fromairports.isEmpty ? 0 : 300.h,
                  child: ListView.builder(
                    itemCount: flight.fromairports.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            "${flight.fromairports[index].cityName!} ${flight.fromairports[index].countryName!}"),
                        subtitle: Text(
                            "${flight.fromairports[index].countryName!} ${flight.fromairports[index].name!}"),
                        leading: const Icon(Icons.flight),
                        trailing: Container(
                            color: Colors.grey.shade300,
                            padding: const EdgeInsets.all(3),
                            child: Text(flight.fromairports[index].code!)),
                        onTap: () {
                          controller.text =
                              "${flight.fromairports[index].countryName!} ${flight.fromairports[index].name!}";

                          context.read<FlightCubit>().setAirport(
                              airport: flight.fromairports[index],
                              airportType: flight.fromairports);
                          context.read<FlightCubit>().clearlist(
                              airportType:
                                  context.read<FlightCubit>().fromairports);
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
