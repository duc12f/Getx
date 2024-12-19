class CartItem {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final String thumbnail;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.thumbnail,
  });

  CartItem copyWith({
    int? id,
    String? title,
    double? price,
    int? quantity,
    String? thumbnail,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
