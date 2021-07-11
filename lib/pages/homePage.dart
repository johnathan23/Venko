import 'package:flutter/material.dart';
import 'package:venko/pages/doctor/doctorPage.dart';
import 'package:venko/pages/patient/patientPage.dart';
import 'package:venko/widgets/bottomNavigation.dart';

class HomePage extends StatefulWidget {

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0; // position initial
  final List<Widget> _children = [
    // Views
    DoctorPage(),
    PatientPage()
    // --- add here more views
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: customBottomNavigationBar(
        currentIndex:_currentIndex, 
        items:[
          // Icon items
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Doctores'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pacientes'
          )
          // --- add here more items 
        ],
        onTap: (index) => setState(()=> _currentIndex = index),
      ),
    );
  }
}