import 'package:flutter/material.dart';

class ReviewFormScreen extends StatelessWidget {
  final String? restaurantId;

  const ReviewFormScreen({super.key, this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('리뷰 작성'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: '리뷰 내용',
                hintText: '맛집에 대한 리뷰를 작성해주세요',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 리뷰 저장 로직
              },
              child: const Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
