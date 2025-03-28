class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double? offerPrice;
  final double quantity;
  final String unit;
  final String category;
  final bool isPopular;
  final bool hasExclusiveDeal;
  final double rating;
  final int numberOfRatings;
  final String description;
  final DateTime? offerValidUntil;
  final int stockAvailable;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.offerPrice,
    required this.quantity,
    required this.unit,
    required this.category,
    this.isPopular = false,
    this.hasExclusiveDeal = false,
    this.rating = 0.0,
    this.numberOfRatings = 0,
    this.description = '',
    this.offerValidUntil,
    required this.stockAvailable,
  });

  double get discountPercentage {
    if (offerPrice != null && price > 0) {
      return ((price - offerPrice!) / price * 100).roundToDouble();
    }
    return 0.0;
  }

  bool get isOnSale =>
      offerPrice != null &&
      offerValidUntil != null &&
      offerValidUntil!.isAfter(DateTime.now());

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'offerPrice': offerPrice,
      'quantity': quantity,
      'unit': unit,
      'category': category,
      'isPopular': isPopular,
      'hasExclusiveDeal': hasExclusiveDeal,
      'rating': rating,
      'numberOfRatings': numberOfRatings,
      'description': description,
      'offerValidUntil': offerValidUntil?.toIso8601String(),
      'stockAvailable': stockAvailable,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      offerPrice: json['offerPrice']?.toDouble(),
      quantity: json['quantity'].toDouble(),
      unit: json['unit'],
      category: json['category'],
      isPopular: json['isPopular'] ?? false,
      hasExclusiveDeal: json['hasExclusiveDeal'] ?? false,
      rating: json['rating']?.toDouble() ?? 0.0,
      numberOfRatings: json['numberOfRatings'] ?? 0,
      description: json['description'] ?? '',
      offerValidUntil: json['offerValidUntil'] != null
          ? DateTime.parse(json['offerValidUntil'])
          : null,
      stockAvailable: json['stockAvailable'],
    );
  }

  Product copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
    double? offerPrice,
    double? quantity,
    String? unit,
    String? category,
    bool? isPopular,
    bool? hasExclusiveDeal,
    double? rating,
    int? numberOfRatings,
    String? description,
    DateTime? offerValidUntil,
    int? stockAvailable,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      category: category ?? this.category,
      isPopular: isPopular ?? this.isPopular,
      hasExclusiveDeal: hasExclusiveDeal ?? this.hasExclusiveDeal,
      rating: rating ?? this.rating,
      numberOfRatings: numberOfRatings ?? this.numberOfRatings,
      description: description ?? this.description,
      offerValidUntil: offerValidUntil ?? this.offerValidUntil,
      stockAvailable: stockAvailable ?? this.stockAvailable,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
