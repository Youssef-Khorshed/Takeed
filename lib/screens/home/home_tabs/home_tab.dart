import 'package:flutter/material.dart';
import 'package:takeed/colors/myapp_colors.dart';
import 'package:takeed/components/text_box/text_box.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.white,
      body: SingleChildScrollView(

        child: Column(
        
          children: [
            // MyTextBox(labelText: 'labelText', hintText: 'hintText'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ChoiceChip(label: Text('One way'), selected: true),
                  ChoiceChip(label: Text('Round'), selected: false),
                ],
              ),
            ),
            Card(
              elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

              child: Column(
                children: [
                  TextField(
                    //controller: firstController,
                    decoration: InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.flight_takeoff_outlined),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {}, // Calls the method to swap text
                    child: Icon(Icons.swap_vert),
                  ),
                  TextField(
                    //controller: firstController,
                    decoration: InputDecoration(
                        labelText: 'To',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.flight_land_outlined)
                    ),
                  ),
        
                      TextField(
                        //controller: firstController,
                        decoration: InputDecoration(
                          labelText: 'From',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.flight_takeoff_outlined),
                        ),
                      ),
                      TextField(
                        //controller: firstController,
                        decoration: InputDecoration(
                          labelText: 'From',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.flight_takeoff_outlined),
                        ),
                      ),
                    ],
        
              ),
        
            ),
          ],
        ),
      ),

    );
  }

}