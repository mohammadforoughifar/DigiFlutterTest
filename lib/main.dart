import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Pages/PoorFroshtarin.dart';
import 'Pages/TopSlider.dart';
import 'Pages/Slid.dart';

void main()
{
  runApp(

    MaterialApp(

      theme: ThemeData(fontFamily: 'byekan'),

    debugShowCheckedModeBanner: false,

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // Persian

      ],



    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
         title: Text("فروغ آریا",style: TextStyle(fontFamily: 'byekan'),),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
              children: [
              //  Slid(),
                TopList(),
             //   Poorfroshtarin(),

              ],
            ),
      ),
        ),
      )

  );
}








