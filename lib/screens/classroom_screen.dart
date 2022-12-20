import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dance/screens/classroom_tabs/activity_tab.dart';
import 'package:i_dance/screens/classroom_tabs/home_tab.dart';
import 'package:i_dance/screens/classroom_tabs/menu_tab.dart';

import 'classroom_tabs/challenge_tab.dart';

class ClassroomScreen extends ConsumerStatefulWidget {
  const ClassroomScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ClassroomScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<ClassroomScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    ActivityTab(),
    ChallengeTab(),
    MenuTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: 'Challenge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
