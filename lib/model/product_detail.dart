class ProductDetail {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String sku;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final String returnPolicy;
  final List<String> tags;
  final List<String> images;
  final String thumbnail;
  final List<Review> reviews;

  ProductDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.sku,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.returnPolicy,
    required this.tags,
    required this.images,
    required this.thumbnail,
    required this.reviews,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      sku: json['sku'],
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      returnPolicy: json['returnPolicy'],
      tags: List<String>.from(json['tags']),
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
      reviews: (json['reviews'] as List)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }
}

class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']),
      reviewerName: json['reviewerName'],
    );
  }
}
