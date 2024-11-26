import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('리뷰',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: '방문 후기를 자유롭게 작성해주세요\n(분위기, 편의시설, 특이사항 등)',
                border: OutlineInputBorder(),
              ),
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
      ),
    );
  }
}
