import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venko/providers/doctorProvider.dart';
import 'package:venko/providers/patientProvider.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/routes/routes.dart';
import 'package:venko/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DoctorProvider()),
        ChangeNotifierProvider(create: (context) => PatientProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: darkCerulean,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HOME_ROUTE,
        routes: getApplicationRoutes()
      ),
    );
  }
}
