import 'package:bag_app/data/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository {
  final CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('products');

  Future<List<Products>> fetchAllProducts() async {
    var _allProducts = <Products>[];
    try {
      QuerySnapshot querySnapshot =
          await _fireStore.doc('categories').collection('all products').get();
      querySnapshot.docs.forEach((element) {
        _allProducts.add(Products.fromJson(element.data()));
      });
    } catch (error, stackTrace) {
      print('Error $error occurs in : ==> $stackTrace');
      _allProducts = [Products.error(error: error.toString())];
    }
    return _allProducts;
  }

  Future<List<Products>> fetchProductsByCategory(
    String categoryName,
  ) async {
    var _products = <Products>[];
    try {
      QuerySnapshot querySnapshot = await _fireStore
          .doc('categories')
          .collection(
              categoryName) /*.where('type' ,isEqualTo: 'Sweatshirt' )add this to sort internal data */
          .get();
      querySnapshot.docs.forEach((_product) {
        _products.add(Products.fromJson(_product.data()));
      });
    } catch (e, stackTrace) {
      print('Error $e occurs in : ==> $stackTrace');
      _products = [Products.error(error: e.toString())];
    }
    return _products;
  }
}
