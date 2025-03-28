class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? profileImageUrl;
  final String? address;
  final DateTime createdAt;
  final DateTime lastLoginAt;
  final bool isActive;
  final List<String> favoriteProducts;
  final String? fcmToken; // For push notifications
  final Map<String, dynamic>? preferences;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.profileImageUrl,
    this.address,
    required this.createdAt,
    required this.lastLoginAt,
    this.isActive = true,
    this.favoriteProducts = const [],
    this.fcmToken,
    this.preferences,
  });

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'address': address,
      'createdAt': createdAt.toIso8601String(),
      'lastLoginAt': lastLoginAt.toIso8601String(),
      'isActive': isActive,
      'favoriteProducts': favoriteProducts,
      'fcmToken': fcmToken,
      'preferences': preferences,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      profileImageUrl: json['profileImageUrl'],
      address: json['address'],
      createdAt: DateTime.parse(json['createdAt']),
      lastLoginAt: DateTime.parse(json['lastLoginAt']),
      isActive: json['isActive'] ?? true,
      favoriteProducts: List<String>.from(json['favoriteProducts'] ?? []),
      fcmToken: json['fcmToken'],
      preferences: json['preferences'],
    );
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profileImageUrl,
    String? address,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    bool? isActive,
    List<String>? favoriteProducts,
    String? fcmToken,
    Map<String, dynamic>? preferences,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      isActive: isActive ?? this.isActive,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      fcmToken: fcmToken ?? this.fcmToken,
      preferences: preferences ?? this.preferences,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
