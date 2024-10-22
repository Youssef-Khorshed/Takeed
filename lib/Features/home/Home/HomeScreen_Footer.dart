import 'package:flutter/material.dart';
import 'package:takeed/core/Routes/routes.dart';

class HomescreenFooter extends StatelessWidget {
  const HomescreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Booking'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Offer'),
        BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}
