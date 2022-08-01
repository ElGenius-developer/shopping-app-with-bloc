part of 'products_bloc.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
      List<Products>? products;
  ProductsSuccessState.filtered({required this.products});
  ProductsSuccessState.all();
}

class ProductsErrorState extends ProductsState {
  final String error;

  ProductsErrorState(this.error);
}
