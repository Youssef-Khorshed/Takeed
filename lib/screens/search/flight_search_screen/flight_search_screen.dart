import 'package:flutter/material.dart';

import '../components/choicec_chips.dart';

class FlightSearchScreen extends StatelessWidget {
  const FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Flight'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Switch for One Way / Round / Multicity

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 // ChoiceChip(label: Text('One way'), selected: true),
                //  ChoiceChip(label: Text('Round'), selected: false),
                  ChoiceChips(),
                ],
              ),
            ),

            // From and To Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // From and To Inputs
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLocationInput(
                            label: 'From',
                            location: 'Delhi',
                            airportCode: 'DEL',
                            airportName: 'Indira Gandhi International Airport',
                            icon: Icons.flight_takeoff,
                          ),
                          Icon(Icons.swap_vert, size: 32.0),
                          _buildLocationInput(
                            label: 'To',
                            location: 'Kolkata',
                            airportCode: 'CCU',
                            airportName: 'Subhash Chandra International Airport',
                            icon: Icons.flight_land,
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),

                      // Date and Traveller Information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDateInput(
                            label: 'Departure',
                            date: '15/07/2022',
                            icon: Icons.calendar_today,
                          ),
                          _buildDateInput(
                            label: 'Return',
                            date: '+ Add Return Date',
                            icon: Icons.calendar_today,
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),

                      // Traveller and Class Info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDropdownInput(label: 'Traveller', value: '1 Adult'),
                          _buildDropdownInput(label: 'Class', value: 'Economy'),
                        ],
                      ),

                      SizedBox(height: 20.0),

                      // Search Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.all(16.0),
                          ),
                          child: Text('Search', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0),

            // Hot Offer Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hot offer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See all'),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildOfferCard(
                    imageUrl: 'assets/mastercard.png',
                    discount: '15%OFF',
                    description: '15% discount with mastercard',
                  ),
                  _buildOfferCard(
                    imageUrl: 'assets/visa.png',
                    discount: '23%OFF',
                    description: '23% discount with visa',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  // Widget for location input
  Widget _buildLocationInput({required String label, required String location, required String airportCode, required String airportName, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey)),
        Row(
          children: [
            Icon(icon, color: Colors.orange),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$location  $airportCode', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(airportName, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // Widget for date input
  Widget _buildDateInput({required String label, required String date, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey)),
        Row(
          children: [
            Icon(icon, color: Colors.orange),
            SizedBox(width: 8.0),
            Text(date, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  // Widget for dropdown input
  Widget _buildDropdownInput({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey)),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Widget for offer card
  Widget _buildOfferCard({required String imageUrl, required String discount, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 200,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl, height: 40), // Image for offer
              SizedBox(height: 10),
              Text(discount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange)),
              SizedBox(height: 5),
              Text(description, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
