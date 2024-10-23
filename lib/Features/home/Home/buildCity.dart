import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class BuildCity extends StatefulWidget {
  final label;
  final IconData icon;
  TextEditingController controller;
  BuildCity({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
  });

  @override
  State<BuildCity> createState() => _BuildCityState();
}

class _BuildCityState extends State<BuildCity> {
  @override
  Widget build(BuildContext context) {
    final List<String> cities = [
      'Delhi',
      'Kolkata',
      'Mumbai',
      'Chennai',
      'Bangalore',
      'Hyderabad',
      'Ahmedabad',
      'Pune',
      'Jaipur',
      'Lucknow',
      // Add more cities as needed
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }

            return cities.where((String city) {
              return city
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selectedCity) {
            setState(() {
              widget.controller.text = selectedCity;
            });
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            widget.controller = textEditingController;
            return TextFormField(
              controller: widget.controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: TextStyles.font14GrayRegular,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: ColorManager.primaryOrnage,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: ColorManager.GrayColor,
                    )),
                prefixIcon: Icon(widget.icon),
                suffixIcon: textEditingController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () => setState(() {
                              widget.controller.clear();
                            }),
                        icon: Icon(Icons.close_rounded))
                    : null,
              ),
            );
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String option = options.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: ListTile(
                          title: Text(option),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
