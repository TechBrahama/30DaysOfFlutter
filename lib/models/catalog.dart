class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iphone 12 pro",
        desc: "Apple phone",
        price: 777,
        color: "#33505a",
        image:
            "https://images.pexels.com/photos/8066715/pexels-photo-8066715.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
