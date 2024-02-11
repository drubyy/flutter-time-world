import 'package:flutter/material.dart';
import 'package:timeofworld/pages/choose_location.dart';
import 'package:timeofworld/pages/loading.dart';
import 'package:timeofworld/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/choose-location': (context) => ChooseLocation(),
  },
));
