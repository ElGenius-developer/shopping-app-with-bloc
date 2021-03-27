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
  Future <bool> addProductToFirebase(Products product) async{
   try{
     _fireStore.doc('categories').collection(product.category).add(product.toJson());
     _fireStore.doc('categories').collection('all products').add(product.toJson());
     return true;
   }catch(error, stackTrace){
     print('Error $error occurs in : ==> $stackTrace');
     return false;
   }

  }
  Future editProduct(
      int id,
      String categoryName,
      Products product
      ) async {
    try {
      QuerySnapshot querySnapshot = await _fireStore
          .doc('categories')
          .collection(
          categoryName).where('id' ,isEqualTo: id ) /*.where('type',isEqualTo: 'coffee machine')*/
          .get();
          print(querySnapshot.docs.first.id);
          _fireStore.doc('categories').collection(categoryName).doc('${querySnapshot.docs.first.id}').set(product.toJson());
      return true;
    } catch (e, stackTrace) {
      print('Error $e occurs in : ==> $stackTrace');
     }
    return false;
  }

}
