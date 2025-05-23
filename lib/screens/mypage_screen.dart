import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  // 로그아웃 동작 함수
  void _logout(BuildContext context) {
    // 로그인 상태 초기화가 필요하면 여기에 추가
    // 예: SharedPreferences.clear(), Provider logout 등

    Navigator.of(context).pushNamedAndRemoveUntil('/signup', (route) => false);
  }
  void _showAppInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('앱 정보'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📱 Seatly'),
            SizedBox(height: 8),
            Text(
              'Seatly는 고급 레스토랑의 좌석을 쉽게 예약할 수 있도록 돕는 앱입니다.\n'
                  '실시간 좌석 정보 확인과 좌석에서 보이는 뷰 탐색 기능을 제공합니다. '
                  '소중한 여러분들의 식사, seatly와 함께 하세요.\n',
            ),
            SizedBox(height: 16),
            Text('👨‍💻 Fidelis'),
            SizedBox(height: 4),
            Text('- 충남대학교 컴퓨터융합학부'),
            Text('- 202402787 김남희'),
            Text('- 202202542 고 건'),
            Text('- 20222560 김사랑'),
            Text('- 20222579 김현진'),
            Text('- 20222592 박찬종'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFCFA857);
    const secondaryColor = Color(0xFFE2C188);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
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
          _MenuSection(
            items: const [
              _MenuItemData(icon: Icons.favorite_border, label: '즐겨찾기한 장소'),
              _MenuItemData(icon: Icons.directions_walk, label: '최근 방문 장소'),
              _MenuItemData(icon: Icons.chat_bubble_outline, label: '내가 쓴 리뷰'),
            ],
            onItemSelected: (context, label) {
              if (label == '즐겨찾기한 장소') {
                Navigator.of(context).pushNamed('/favorites');
              } else if (label == '최근 방문 장소') {
                Navigator.of(context).pushNamed('/recent');
              } else if (label == '내가 쓴 리뷰') {
                Navigator.of(context).pushNamed('/review');
              }
            },
          ),
          const SizedBox(height: 16),
          _MenuSection(
            items: const [
              _MenuItemData(icon: Icons.notifications_none, label: '알림 설정'),
              _MenuItemData(icon: Icons.shield_outlined, label: '개인정보 관리'),
              _MenuItemData(icon: Icons.logout, label: '로그아웃', isDestructive: true),
            ],
            onItemSelected: (context, label) {
              if (label == '로그아웃') {
                _logout(context);
              }
            },
          ),
          const SizedBox(height: 16),
          _MenuSection(
            items: const [
              _MenuItemData(icon: Icons.help_outline, label: '고객 지원', isGray: true),
              _MenuItemData(icon: Icons.info_outline, label: '앱 정보', isGray: true),
            ],
            onItemSelected: (context, label) {
              if (label == '앱 정보') {
                _showAppInfoDialog(context);
              } else {
                debugPrint('Tapped: $label');
              }
            },
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
  final void Function(BuildContext, String) onItemSelected;

  const _MenuSection({
    required this.items,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Column(
        children: items
            .map((item) => _MenuItem(item: item, onTap: () => onItemSelected(context, item.label)))
            .toList(),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final _MenuItemData item;
  final VoidCallback onTap;

  const _MenuItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final iconColor = item.isDestructive
        ? Colors.red
        : item.isGray
        ? Colors.grey
        : const Color(0xFFCFA857);

    final textColor = item.isDestructive ? Colors.red : Colors.black;

    return InkWell(
      onTap: onTap,
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
