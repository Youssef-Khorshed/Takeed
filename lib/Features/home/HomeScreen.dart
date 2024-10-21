import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/home/HomeScreen_Body.dart';
import 'package:takeed/Features/home/HomeScreen_Footer.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String _tripType = 'One way';
  String _fromCity = 'Delhi';
  String _toCity = 'Kolkata';
  DateTime _departureDate = DateTime.now();
  DateTime? _returnDate;
  int _adults = 1;
  String _classType = 'Economy';
  bool __PickdepartureDateFirstTime = false;
  bool __PickReturnDateFirstTime = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.homescreenBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Book Flight'),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTripTypeSelector(),
              SizedBox(height: 16),
              _OneWay(),
              HomescreenBody()
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomescreenFooter(),
    );
  }

  Widget _buildTripTypeSelector() {
    final tripTypes = ['One way', 'Round'];

    return ClipRRect(
      borderRadius: BorderRadius.circular(32.r),
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r), color: Colors.white),
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
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: Text(
                        type,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
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

  Widget _buildCityInput(
      {required String label, required String hint, required IconData icon}) {
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
        // Text(label,
        //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

        SizedBox(height: 8),
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
              if (label == 'From') {
                _fromCity = selectedCity;
              } else {
                _toCity = selectedCity;
              }
            });
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hint,
                labelText: label,
                labelStyle: TextStyles.font14GrayRegular,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: ColorManager.primaryOrnage,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: ColorManager.GrayColor,
                    )),
                prefixIcon: Icon(icon),
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
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
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

  Widget _buildDateSelectors() {
    return Row(
      children: [
        Expanded(
          child: _buildDateInput(
            label: __PickdepartureDateFirstTime == false
                ? 'Departure'
                : '${_departureDate.day}/${_departureDate.month}/${_departureDate.year}',
            date: _departureDate,
            onTap: () => _selectDate(context, isDeparture: true),
          ),
        ),
        SizedBox(width: 16.w),
        _tripType == 'Round'
            ? Expanded(
                child: _buildDateInput(
                  label: __PickReturnDateFirstTime == false
                      ? 'Return'
                      : '${_departureDate.day}/${_departureDate.month}/${_departureDate.year}',
                  date: _returnDate,
                  prefixIcon: _tripType == 'Round'
                      ? Icons.date_range
                      : Icons.add_box_outlined,
                  onTap: () => _goToRound(),
                ),
              )
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
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              prefixIcon ?? Icons.date_range,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownSelectors() {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            value: _adults,
            decoration: InputDecoration(labelText: 'Traveller'),
            items: List.generate(
              9,
              (index) => DropdownMenuItem(
                  child: Text('${index + 1} Adult'), value: index + 1),
            ),
            onChanged: (value) {
              setState(() {
                _adults = value!;
              });
            },
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: _classType,
            decoration: InputDecoration(labelText: 'Class'),
            items: ['Economy', 'Business']
                .map((classType) =>
                    DropdownMenuItem(child: Text(classType), value: classType))
                .toList(),
            onChanged: (value) {
              setState(() {
                _classType = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _OneWay() {
    return Column(
      children: [
        _buildCityInput(
            label: 'From', hint: _fromCity, icon: Icons.flight_takeoff),
        SizedBox(height: 16),
        _buildCityInput(label: 'To', hint: _toCity, icon: Icons.flight_land),
        SizedBox(height: 16),
        _buildDateSelectors(),
        SizedBox(height: 16),
        _buildDropdownSelectors(),
        SizedBox(height: 16),
      ],
    );
  }
}
