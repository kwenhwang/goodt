import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String restaurantId;
  final String name;
  final String category;
  final String location;
  final String distance;
  final double rating;
  final int reviewCount;
  final List<String> menus;
  final String price;
  final bool isPreparation;

  const RestaurantDetailScreen({
    super.key,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.location,
    this.distance = '',
    this.rating = 0.0,
    this.reviewCount = 0,
    this.menus = const [],
    this.price = '',
    this.isPreparation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 그리드
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Container(
                  color: Colors.grey[200],
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isPreparation)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[50],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '준비중',
                            style: TextStyle(
                              color: Colors.orange[300],
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.restaurant_menu,
                          size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(category),
                      const SizedBox(width: 8),
                      Icon(Icons.location_on,
                          size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text('$location $distance'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(' 평가 $reviewCount명'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('메뉴: ${menus.join(", ")}'),
                  const SizedBox(height: 8),
                  Text('가격: $price'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
