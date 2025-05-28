import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'mypage_screen.dart';
import '../widgets/navigation_bar.dart';
import 'restrauntdetail_screen.dart';
import 'seat_screen.dart' show globalReservations;
import '../main.dart' show routeObserver; // RouteObserver import

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // 예약 후 메인으로 돌아왔을 때 즉시 갱신
    setState(() {});
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
class _HomeTabContent extends StatefulWidget {
  @override
  State<_HomeTabContent> createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<_HomeTabContent> {
  @override
  void initState() {
    super.initState();
  }

  String _tableLabel(String table) {
    // 예: '테이블 1,2' → '테이블 1,2'
    if (table.isEmpty || table == '-') return '테이블 미지정';
    return table;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        elevation: 0,
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
                fillColor: const Color(0xFFE5E7EB),
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
                children: [
                  ...globalReservations.map(
                    (r) => _ReservationCard(
                      title: r.title,
                      time: r.time + (r.people > 0 ? ' · ${r.people}명' : ''),
                      status: r.status,
                      statusColor: r.statusColor,
                      table: _tableLabel(r.table),
                    ),
                  ),
                  // 기존 더미 예약 카드(필요시 유지)
                  _ReservationCard(
                    title: '오아시스 레스토랑',
                    time: '오늘 18:00',
                    status: '확정',
                    statusColor: Colors.green,
                    table: '테이블 A-12',
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
            const _HistoryItem(title: "르브와 레스토랑", time: "5월 25일 13:00 - 15:00"),
            const _HistoryItem(title: "베케 과자점", time: "5월 18일 10:00 - 12:00"),
            const _HistoryItem(title: "산호여", time: "5월 17일 12:00 - 14:00"),

            const SizedBox(height: 24),

            // 추천 장소
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '추천 장소',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "더보기",
                    style: TextStyle(color: Color(0xFFCFA857), fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _RecommendPlaceCard(
                      title: '비스트로 파리',
                      imageUrl:
                          'https://readdy.ai/api/search-image?query=french%20bistro%20interior%20with%20vintage%20decor%2C%20classic%20table%20settings%2C%20wine%20bottles%20display%2C%20romantic%20lighting%2C%20parisian%20atmosphere%2C%20elegant%20dining%20space&width=300&height=200&seq=5&orientation=landscape',
                      description: '파리지앵의 감성을 담은 프렌치 다이닝',
                      rating: 4.7,
                      ratingCount: 98,
                    ),
                    _RecommendPlaceCard(
                      title: '디저트 랩',
                      imageUrl:
                          'https://readdy.ai/api/search-image?query=dessert%20cafe%20interior%20with%20pastry%20display%2C%20elegant%20cake%20presentation%2C%20marble%20counters%2C%20pastel%20colors%2C%20modern%20patisserie%20design%2C%20instagram%20worthy%20setting&width=300&height=200&seq=6&orientation=landscape',
                      description: '트렌디한 디저트와 커피를 즐기는 공간',
                      rating: 4.8,
                      ratingCount: 86,
                    ),
                    _RecommendPlaceCard(
                      title: '스시 오마카세',
                      imageUrl:
                          'https://readdy.ai/api/search-image?query=japanese%20fusion%20restaurant%20interior%2C%20minimalist%20design%2C%20sushi%20counter%2C%20zen%20atmosphere%2C%20wooden%20elements%2C%20soft%20ambient%20lighting%2C%20contemporary%20asian%20dining%20space&width=300&height=200&seq=7&orientation=landscape',
                      description: '최고급 오마카세를 즐기는 프라이빗 공간',
                      rating: 4.9,
                      ratingCount: 112,
                    ),
                  ],
                ),
              ),
            ),
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

class _RecommendPlaceCard extends StatelessWidget {
  final String title, imageUrl, description;
  final double rating;
  final int ratingCount;

  const _RecommendPlaceCard({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 70,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        4,
                        (i) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 12,
                        ),
                      ),
                    ),
                    const Icon(Icons.star_half, color: Colors.amber, size: 12),
                    Text(' $rating', style: const TextStyle(fontSize: 11)),
                    Text(
                      ' ($ratingCount)',
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
