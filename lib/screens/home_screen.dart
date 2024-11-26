import 'package:flutter/material.dart';
import '../services/restaurant_service.dart';

class HomeScreen extends StatelessWidget {
  late final RestaurantService _restaurantService;

  HomeScreen({super.key}) {
    _restaurantService = RestaurantService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _restaurantService.loadRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No restaurants found'));
          }

          final restaurants = snapshot.data!;

          return CustomScrollView(
            slivers: [
              // 검색바
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '장소, 메뉴, 지역 검색',
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/search');
                    },
                  ),
                ),
              ),

              // 베스트/내가 찜한 탭
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('베스트 맛집',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text('내가 찜한',
                              style: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 필터 옵션
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Row(
                    children: [
                      _buildFilterChip('종류'),
                      _buildFilterChip('랭킹순'),
                      _buildFilterChip('업종'),
                      _buildFilterChip('반경 618m'),
                      _buildFilterChip('분위기'),
                    ],
                  ),
                ),
              ),

              // 맛집 리스트
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final restaurant = restaurants[index];
                    return _buildRestaurantItem(
                      number: index + 1,
                      name: restaurant['name'],
                      category: restaurant['category'],
                      location: restaurant['location'],
                      distance: restaurant['distance'],
                      rating: restaurant['rating'].toDouble(),
                      reviewCount: restaurant['reviewCount'],
                      menus: List<String>.from(restaurant['menus']),
                      price: restaurant['price'],
                      isPreparation: true,
                    );
                  },
                  childCount: restaurants.length,
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 2:
              Navigator.pushNamed(context, '/write');
              break;
            case 4:
              Navigator.pushNamed(context, '/mypage');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: '리뷰'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: '글쓰기'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: '알림'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: '마이'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey[300]!),
        ),
      ),
    );
  }

  Widget _buildRestaurantItem({
    required int number,
    required String name,
    required String category,
    required String location,
    required String distance,
    required double rating,
    required int reviewCount,
    required List<String> menus,
    required String price,
    required bool isPreparation,
  }) {
    return InkWell(
      onTap: () {
        // 상세 페이지로 이동
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$number. $name',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isPreparation)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                Icon(Icons.restaurant_menu, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  category,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(width: 8),
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '$location $distance',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 8),
            Text('메뉴: ${menus.join(", ")}'),
            const SizedBox(height: 4),
            Text('가격: $price'),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
