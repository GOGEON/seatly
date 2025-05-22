import 'package:flutter/material.dart';
// 불필요한 직접 import 제거 (pushNamed로 이동 통일)

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFCFA857);
    const secondaryColor = Color(0xFFE2C188);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // Tailwind gray-50
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('내 정보', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton.icon(
            onPressed: () {
              // 편집 버튼 동작
            },
            icon: const Icon(Icons.edit, color: primaryColor),
            label: const Text('편집', style: TextStyle(color: primaryColor)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          // 프로필 정보
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.1),
                  secondaryColor.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://readdy.ai/api/search-image?query=professional%20portrait%20photo%20of%20a%20Korean%20woman%20in%20her%2030s%2C%20natural%20makeup%2C%20friendly%20smile%2C%20soft%20lighting%2C%20high%20quality%2C%20studio%20photo&width=200&height=200&seq=1&orientation=squarish",
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '김지현',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '대전에서 맛집 탐방 중',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _ProfileStat(count: 42, label: '리뷰'),
                    _ProfileStat(count: 78, label: '방문 장소'),
                    _ProfileStat(count: 23, label: '즐겨찾기'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 메뉴 리스트
          const _MenuSection(
            items: [
              _MenuItemData(icon: Icons.favorite_border, label: '즐겨찾기한 장소'),
              _MenuItemData(icon: Icons.directions_walk, label: '최근 방문 장소'),
              _MenuItemData(icon: Icons.chat_bubble_outline, label: '내가 쓴 리뷰'),
            ],
          ),
          const SizedBox(height: 16),
          const _MenuSection(
            items: [
              _MenuItemData(icon: Icons.notifications_none, label: '알림 설정'),
              _MenuItemData(icon: Icons.shield_outlined, label: '개인정보 관리'),
              _MenuItemData(
                icon: Icons.logout,
                label: '로그아웃',
                isDestructive: true,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _MenuSection(
            items: [
              _MenuItemData(
                icon: Icons.help_outline,
                label: '고객 지원',
                isGray: true,
              ),
              _MenuItemData(
                icon: Icons.info_outline,
                label: '앱 정보',
                isGray: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final int count;
  final String label;

  const _ProfileStat({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFCFA857);
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

class _MenuSection extends StatelessWidget {
  final List<_MenuItemData> items;

  const _MenuSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Column(
        children: items.map((item) => _MenuItem(item: item)).toList(),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final _MenuItemData item;

  const _MenuItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final iconColor =
        item.isDestructive
            ? Colors.red
            : item.isGray
            ? Colors.grey
            : const Color(0xFFCFA857);

    final textColor = item.isDestructive ? Colors.red : Colors.black;

    return InkWell(
      onTap: () {
        // 각 메뉴 동작 구현
        if (item.label == '즐겨찾기한 장소') {
          Navigator.of(context).pushNamed('/favorites');
        } else if (item.label == '최근 방문 장소') {
          Navigator.of(context).pushNamed('/recent');
        } else if (item.label == '내가 쓴 리뷰') {
          Navigator.of(context).pushNamed('/review');
        } else {
          debugPrint('Tapped: \\${item.label}');
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFF1F1F1), width: 1),
          ),
        ),
        child: Row(
          children: [
            Icon(item.icon, color: iconColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label,
                style: TextStyle(fontSize: 14, color: textColor),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String label;
  final bool isDestructive;
  final bool isGray;

  const _MenuItemData({
    required this.icon,
    required this.label,
    this.isDestructive = false,
    this.isGray = false,
  });
}
