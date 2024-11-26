import 'package:flutter/material.dart';

class RestaurantFoodInfo extends StatelessWidget {
  const RestaurantFoodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '음식 정보',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // CustomInputField를 TextFormField로 대체
            TextFormField(
              decoration: const InputDecoration(
                labelText: '메뉴명',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '메뉴명을 입력해주세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: '음식 종류',
                border: OutlineInputBorder(),
              ),
              items: ['한식', '중식', '일식', '양식']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
          ],
        ),
      ),
    );
  }
}
