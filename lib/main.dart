import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/restaurant_detail_screen.dart';
import 'screens/write_screen.dart';
import 'screens/mypage_screen.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: HomeScreen(), // const 제거
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/search':
            return MaterialPageRoute(builder: (_) => const SearchScreen());
          case '/write':
            return MaterialPageRoute(builder: (_) => const WriteScreen());
          case '/restaurant/detail':
            final args = settings.arguments as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder: (_) => RestaurantDetailScreen(
                restaurantId: args?['restaurantId'] ?? '1',
                name: args?['name'] ?? '',
                category: args?['category'] ?? '',
                location: args?['location'] ?? '',
              ),
            );
          case '/mypage':
            return MaterialPageRoute(builder: (_) => const MyPageScreen());
          default:
            return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
    );
  }
}
