import 'package:bag_app/ui/screens/home.dart';
import 'package:bag_app/ui/screens/welcoming.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final bool isLoggedIn;

  const Authenticate({Key key, this.isLoggedIn =false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(isLoggedIn)
      return Home();
    else
      return Welcoming();
  }
}