import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'mypage_screen.dart';
import '../widgets/navigation_bar.dart';
import 'restrauntdetail_screen.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    _HomeTabContent(), // 홈 탭의 실제 내용
    SearchScreen(),
    MyPageScreen(),
  ];

  void _onNavTap(int index) {
    if (index == _selectedIndex) return;
    if (index == 0) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else if (index == 1) {
      Navigator.pushNamedAndRemoveUntil(context, '/search', (route) => false);
    } else if (index == 2) {
      Navigator.pushNamedAndRemoveUntil(context, '/mypage', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

// 기존 홈 탭의 실제 내용(예약, 인기장소 등)을 별도 위젯으로 분리
class _HomeTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6), // 바탕색과 동일하게 맞춤
        surfaceTintColor: const Color(0xFFF3F4F6), // Material3에서 tint 제거
        foregroundColor: Colors.black87, // 아이콘/텍스트 컬러 명시
        shadowColor: Colors.transparent, // 그림자 제거로 깔끔하게
        elevation: 1,
        title: const Text(
          'seatly',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 24,
            color: Color(0xFFCFA857),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFE5E7EB), // hover 상태의 연한 회색으로 변경
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: '장소 또는 좌석 검색',
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 나의 예약
            _sectionHeader(title: "나의 예약", onTap: () {}),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _ReservationCard(
                    title: '오아시스 레스토랑',
                    time: '오늘 15:00 - 17:00',
                    status: '확정',
                    statusColor: Colors.green,
                    table: '테이블 A-12',
                  ),
                  _ReservationCard(
                    title: '삐아또 레스토랑',
                    time: '내일 12:00 - 14:00',
                    status: '예약중',
                    statusColor: Colors.blue,
                    table: '테이블 B-03',
                  ),
                  _ReservationCard(
                    title: '모퉁이 카페',
                    time: '5월 20일 13:00 - 15:00',
                    status: '대기중',
                    statusColor: Colors.orange,
                    table: '창가 좌석 T-05',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 인기 장소
            _sectionHeader(title: "인기 장소", onTap: () {}),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailScreen(),
                      ),
                    );
                  },
                  child: const _PlaceCard(
                    title: '라 피아짜',
                    imageUrl:
                        'https://readdy.ai/api/search-image?query=modern%20italian%20restaurant%20interior%20with%20elegant%20table%20settings%2C%20warm%20lighting%2C%20wine%20glasses%2C%20rustic%20wooden%20furniture%2C%20romantic%20atmosphere%2C%20high-end%20dining%20experience&width=300&height=200&seq=1&orientation=landscape',
                    rating: 4.7,
                    description: '대전 중구 은행동 · 이탈리안 레스토랑',
                  ),
                ),
                const _PlaceCard(
                  title: '카페 브런치',
                  imageUrl:
                      'https://readdy.ai/api/search-image?query=trendy%20brunch%20cafe%20interior%20with%20marble%20tables%2C%20lush%20plants%2C%20artisanal%20coffee%20preparation%2C%20pastry%20display%2C%20natural%20lighting%2C%20instagram%20worthy%20setting&width=300&height=200&seq=2&orientation=landscape',
                  rating: 4.8,
                  description: '대전 서구 둔산동 · 브런치 카페',
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 최근 예약
            _sectionHeader(title: "최근 예약", onTap: () {}),
            const SizedBox(height: 8),
            const _HistoryItem(title: "르브와 레스토랑", time: "5월 10일 13:00 - 15:00"),
            const _HistoryItem(title: "베케 과자점", time: "5월 8일 10:00 - 12:00"),
            const _HistoryItem(title: "산호여", time: "5월 5일 12:00 - 14:00"),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader({required String title, required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            "전체보기",
            style: TextStyle(color: Color(0xFFCFA857), fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _ReservationCard extends StatelessWidget {
  final String title, time, status, table;
  final Color statusColor;

  const _ReservationCard({
    required this.title,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(fontSize: 10, color: statusColor),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Color(0xFFCFA857),
              ),
              const SizedBox(width: 4),
              Text(table, style: const TextStyle(fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  final String title, imageUrl, description;
  final double rating;

  const _PlaceCard({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.description,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    Text('$rating', style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String title;
  final String time;

  const _HistoryItem({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const Text(
            '완료',
            style: TextStyle(fontSize: 11, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
