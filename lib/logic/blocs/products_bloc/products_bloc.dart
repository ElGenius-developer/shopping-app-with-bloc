import 'dart:async';

import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/data/models/products.dart';
import 'package:bag_app/data/repository/products_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial());
  final _productsRepository = ProductsRepository();
 static List<Products> _products = <Products>[];
  List<Products> _allProducts = <Products>[];

 static List<Products> get products => _products;
  List<Products> get allProducts => _allProducts;

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    yield ProductsLoadingState();
    try {
      if (event is FetchAllProducts) {
    _allProducts = await _productsRepository.fetchAllProducts();
    yield ProductsSuccessState.all();
    }
    else  if (event is FetchProductsByCategory) {
        _products = await _productsRepository
            .fetchProductsByCategory(event.categoryName);
        final firstType = StaticData()
            .typesList[StaticData().categoriesList.indexOf(event.categoryName)]
            .first;
        final firstTypeProductList = _products
            .where((element) => element.type.toLowerCase().contains(firstType))
            .toList();

        yield ProductsSuccessState.filtered(products: firstTypeProductList);
      }
    else if (event is FetchProductsByType) {
     final newList=_products
         .where((element) => element.type.toLowerCase().contains(event.type))
         .toList();
        yield ProductsSuccessState.filtered(products: newList);
      }
    } catch (error /*,stacktrace*/) {
      yield ProductsErrorState(error.toString());
    }
  }
}
