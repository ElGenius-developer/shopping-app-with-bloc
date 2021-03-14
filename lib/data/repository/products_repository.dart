import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/data/models/products.dart';
import 'package:dio/dio.dart';

class ProductsRepository {


  Future<List<Products>> fetchProducts() async {
    var _products=<Products>[];
    try {
      final response = await Dio().get(StaticData().baseURL,);
      if (response.statusCode == 200) {
        response.data.forEach(( element) {
          _products.add(Products.fromJson(element));
        });
      } else {
        _products = [ Products.error(error: 'error occurs')];
      }
    } catch (e, stackTrace) {
      print('Error $e occurs in : ==> $stackTrace');
      _products = [Products.error(error: e.toString())];
    }
    return _products;
  }
 Future<List<Products>> fetchProductsByCategory(
     String categoryName,
     ) async {
   var _products=<Products>[];
    final String url ='${StaticData().categoriesURL}$categoryName';
   try {
     final response = await Dio().get(url);
     if (response.statusCode == 200) {
      await response.data.forEach(( element) {
         _products.add(Products.fromJson(element));

       });
     } else {
       _products = [ Products.error(error: 'error occurs')];
     }
   } catch (e, stackTrace) {
     print('Error $e occurs in : ==> $stackTrace');
     _products = [Products.error(error: e.toString())];
   }
   return _products;
 }
}
