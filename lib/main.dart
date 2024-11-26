import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/restaurant_detail_screen.dart';
import 'screens/write_screen.dart';
import 'screens/mypage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '맛집 기록',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/search':
            return MaterialPageRoute(builder: (_) => const SearchScreen());
          case '/restaurant/detail':
            final args = settings.arguments as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder: (_) => RestaurantDetailScreen(
                restaurantId: args?['restaurantId'] ?? '1',
                name: args?['name'] ?? '맛집 이름',
                category: args?['category'] ?? '카테고리',
                location: args?['location'] ?? '위치',
              ),
            );
          case '/write':
            return MaterialPageRoute(builder: (_) => const WriteScreen());
          case '/mypage':
            return MaterialPageRoute(builder: (_) => const MyPageScreen());
          default:
            return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
    );
  }
}
