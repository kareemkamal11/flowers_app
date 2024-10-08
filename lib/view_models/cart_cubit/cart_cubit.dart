import 'package:flowers/model/cart/cart_item_data.dart';
import 'package:flowers/model/cart/cart_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItemModel> cItemsCartData = itemsCartData;

  double get totalPrice => cItemsCartData.fold(
      0, (previousValue, element) => previousValue + element.totalPrice);
  int get totalItems => cItemsCartData.fold(
      0, (previousValue, element) => previousValue + element.totalProducts);

  icrement(int index) {
    cItemsCartData[index].totalProducts++;
    cItemsCartData[index].totalPrice =
        cItemsCartData[index].price * cItemsCartData[index].totalProducts;
    emit(CartIncremented());
  }

  decrement(int index) {
    cItemsCartData[index].totalProducts--;
    cItemsCartData[index].totalPrice =
        cItemsCartData[index].price * cItemsCartData[index].totalProducts;
    emit(CartDecremented());
  }

  removeItem(int index) {
    cItemsCartData.removeAt(index);
    emit(CartRemovedItem());
  }

  addItem(CartItemModel item) {
    cItemsCartData.add(item);
    emit(CartAddedItem());
  }

  checkout() {
    cItemsCartData.clear();
    emit(CartCheckout());
  }

}
