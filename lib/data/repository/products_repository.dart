import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/data/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class ProductsRepository {

  final CollectionReference _firestore = FirebaseFirestore.instance.collection('products');


 Future<List<Products>> fetchProductsByCategory(
     String categoryName,) async {
   var _products=<Products>[];
 try{
   QuerySnapshot documentSnapshot = await _firestore.doc('categories')
       .collection(categoryName)
   /*.where('type' ,isEqualTo:'Pullover' ) add this to sort internal data*/.get();
   documentSnapshot.docs.forEach((_product) {
     _products.add(Products.fromJson(_product.data()));
   });

   } catch (e, stackTrace) {
     print('Error $e occurs in : ==> $stackTrace');
     _products = [Products.error(error: e.toString())];
   }
   return _products;
 }
}