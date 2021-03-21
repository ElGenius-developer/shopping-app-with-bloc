part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class FetchAllProducts extends ProductsEvent {}

class FetchProductsByCategory extends ProductsEvent {
  final String categoryName;

  FetchProductsByCategory(this.categoryName);
}
class FetchProductsByType extends ProductsEvent {
  final String type;
  FetchProductsByType(this.type);
}

class AddProductToCart extends ProductsEvent {
  final Products product;

  AddProductToCart(this.product);
}

class RemoveProductFromCart extends ProductsEvent {
  final Products product;
  RemoveProductFromCart(this.product);
}
