
import 'package:flutter/material.dart';

class FlightSearchCard extends StatelessWidget
{
  const FlightSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                         TextField(

                         ),
                          Icon(Icons.swap_vert, size: 32.0),
                          TextField(

                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),

                      // Date and Traveller Information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DatePickerDialog(firstDate: DateTime.now(), lastDate: DateTime.now()),

                        ],
                      ),

                      SizedBox(height: 20.0),

                      // Traveller and Class Info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

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

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

}