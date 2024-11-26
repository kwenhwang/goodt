import 'package:flutter/material.dart';

class RestaurantBasicInfo extends StatelessWidget {
  const RestaurantBasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '기본 정보',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '상호명',
                hintText: '맛집 이름을 입력하세요',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '주소',
                hintText: '주소를 입력하세요',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '전화번호',
                hintText: '전화번호를 입력하세요',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '영업시간',
                hintText: '영업시간을 입력하세요',
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('주차 가능 여부'),
              value: false,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}
