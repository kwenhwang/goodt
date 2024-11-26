import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('알림 설정'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // 알림 설정 변경 로직
              },
            ),
          ),
          ListTile(
            title: const Text('프로필 수정'),
            onTap: () {
              // 프로필 수정 페이지로 이동
            },
          ),
          ListTile(
            title: const Text('로그아웃'),
            onTap: () {
              // 로그아웃 로직
            },
          ),
        ],
      ),
    );
  }
}
