import 'package:flutter/material.dart';
import 'package:youtube_clone/views/screens/other%20screens/add_screen.dart';
import 'package:youtube_clone/views/screens/other%20screens/explore_screen.dart';
import 'package:youtube_clone/views/screens/other%20screens/home_screen.dart';
import 'package:youtube_clone/views/screens/other%20screens/library_screen.dart';
import 'package:youtube_clone/views/screens/other%20screens/subscription_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const AddScreen(),
    const ExploreScreen(),
    const LibraryScreen(),
    const SubscriptionScreen()
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _navigateBottomBar(index),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: [
          // Home icon
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          // Explore icon
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          // Add icon
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          // Subscriptions icon
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          // Video Library icon
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: 'Video Library',
          ),
        ],
      ),
    );
  }
}
