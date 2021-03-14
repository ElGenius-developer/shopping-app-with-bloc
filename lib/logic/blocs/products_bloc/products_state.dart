part of 'products_bloc.dart';

abstract class ProductsState extends Equatable{
  const ProductsState();

}

class ProductsInitial extends ProductsState {



  @override
  List<Object> get props => [];

}
class ProductsLoadingState extends ProductsState {


  @override
  List<Object> get props => [];
}
class ProductsSuccessState extends ProductsState {
 final   List<Products> products;
 static List<Products> prods;


 ProductsSuccessState(this.products);
 @override
List<Object> get props => [products];
}
class ProductsErrorState extends ProductsState {
  final String error;

  ProductsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
