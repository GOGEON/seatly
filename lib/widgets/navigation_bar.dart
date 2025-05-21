import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFF9FAFB), // 앱 전체 배경색과 통일
      elevation: 8, // 상단 그림자 효과
      type: BottomNavigationBarType.fixed, // 고정형
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xFFCFA857), // primary
      unselectedItemColor: const Color(0xFFBDBDBD), // 밝은 회색
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
      ],
    );
  }
}
