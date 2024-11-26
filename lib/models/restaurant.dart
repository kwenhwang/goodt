class Restaurant {
  final String id;
  // 기본 정보
  final String name;
  final String address;
  final String phone;
  final String businessHours;
  final bool hasParking;
  final String priceRange;

  // 음식 관련 정보
  final String cuisine;
  final List<String> mainDishes;
  final List<String> menuItems;
  final List<String> photos;
  final double rating;

  // 리뷰 정보
  final String review;
  final DateTime visitDate;
  final DateTime createdAt;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.businessHours,
    required this.hasParking,
    required this.priceRange,
    required this.cuisine,
    required this.mainDishes,
    required this.menuItems,
    required this.photos,
    required this.rating,
    required this.review,
    required this.visitDate,
    DateTime? createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  // Map으로 변환하는 메서드
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'businessHours': businessHours,
      'hasParking': hasParking,
      'priceRange': priceRange,
      'cuisine': cuisine,
      'mainDishes': mainDishes,
      'menuItems': menuItems,
      'photos': photos,
      'rating': rating,
      'review': review,
      'visitDate': visitDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Map에서 객체를 생성하는 팩토리 생성자
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      phone: map['phone'],
      businessHours: map['businessHours'],
      hasParking: map['hasParking'],
      priceRange: map['priceRange'],
      cuisine: map['cuisine'],
      mainDishes: List<String>.from(map['mainDishes']),
      menuItems: List<String>.from(map['menuItems']),
      photos: List<String>.from(map['photos']),
      rating: map['rating'],
      review: map['review'],
      visitDate: DateTime.parse(map['visitDate']),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  // 복사본을 생성하는 메서드
  Restaurant copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? businessHours,
    bool? hasParking,
    String? priceRange,
    String? cuisine,
    List<String>? mainDishes,
    List<String>? menuItems,
    List<String>? photos,
    double? rating,
    String? review,
    DateTime? visitDate,
    DateTime? createdAt,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      businessHours: businessHours ?? this.businessHours,
      hasParking: hasParking ?? this.hasParking,
      priceRange: priceRange ?? this.priceRange,
      cuisine: cuisine ?? this.cuisine,
      mainDishes: mainDishes ?? this.mainDishes,
      menuItems: menuItems ?? this.menuItems,
      photos: photos ?? this.photos,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      visitDate: visitDate ?? this.visitDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
