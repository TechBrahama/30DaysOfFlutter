import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<int> _itemIds = []; //stores id of each element

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutattion extends VxMutation<MyStore> {
  final Item item;

  AddMutattion(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
