part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent  extends Equatable{
  const ProductsEvent();
}

class FetchProducts extends ProductsEvent{
  @override
  List<Object> get props => [];
}
class FetchProductsByCategory extends ProductsEvent{
  final String categoryName;

  FetchProductsByCategory(this.categoryName);
  @override
  List<Object> get props => [categoryName];
}
class AddProductToCart extends ProductsEvent{
  final Products product;

  AddProductToCart(this.product);
  @override
  List<Object> get props => [product];
}
class RemoveProductFromCart extends ProductsEvent{
  final Products product;
  RemoveProductFromCart(this.product);
  @override
  List<Object> get props => [product];
}