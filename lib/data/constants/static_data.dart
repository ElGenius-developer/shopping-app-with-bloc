import 'package:flutter/material.dart';

class StaticData{
  final sentences = [
    "Welcome to my Shopping app.",
    "It's a demo app for practicing on flutter development",
    'You can create an Email or login then you can choose product to buy.',
    'if you like any product you can add it to your cart to buy it ',
    'or you can add it to wish list '
  ];
  final categoriesList =["electronics","jewelery","men clothing","women clothing"];
  final String baseURL='https://fakestoreapi.com/products';//all products
  final String categoriesURL='https://fakestoreapi.com/products/category/';//custom category
  final Color pinkColor = Color(0xF8CD265A);
  final Color blueColor =Color(0xE90974C8);



}