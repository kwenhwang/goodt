import 'package:flutter/material.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('맛집 목록'),
      ),
      body: ListView.builder(
        itemCount: 10, // 임시 데이터 개수
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('맛집 ${index + 1}'),
            subtitle: const Text('주소 정보'),
            onTap: () {
              // 상세 페이지로 이동
              Navigator.pushNamed(context, '/restaurant/detail');
            },
          );
        },
      ),
    );
  }
}
