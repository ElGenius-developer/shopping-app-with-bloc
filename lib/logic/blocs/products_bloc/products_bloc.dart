import 'dart:async';

import 'package:bag_app/data/models/products.dart';
import 'package:bag_app/data/repository/products_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial());
  final _productsRepository = ProductsRepository();
  List<Products> _products = <Products>[];

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    print(event);
    yield ProductsLoadingState();
    try {
      if (event is FetchProducts) {
        _products = await _productsRepository.fetchProducts();
        yield ProductsSuccessState(_products);
      } else if (event is FetchProductsByCategory) {
        _products = await _productsRepository
            .fetchProductsByCategory(event.categoryName);

        yield ProductsSuccessState(_products);
      }
    } catch (error /*,stacktrace*/) {
      yield ProductsErrorState(error.toString());
    }
  }
}
