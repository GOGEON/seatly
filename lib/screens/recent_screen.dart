import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFCFA857);
    final List<_RecentPlace> places = [
      _RecentPlace(
        name: '에이트',
        date: '2025년 5월 19일',
        desc: '대전시 유성구에 위치한 분위기 좋은 카페. 특제 아인슈페너와 수제 디저트가 인기 메뉴입니다.',
        rating: 4.8,
        category: '카페 · 디저트',
        imageUrl:
            'https://readdy.ai/api/search-image?query=modern%2520Korean%2520cafe%2520interior%2520with%2520wooden%2520furniture%252C%2520plants%252C%2520and%2520natural%2520lighting%252C%2520cozy%2520atmosphere%252C%2520aesthetic%2520design%252C%2520high%2520quality%2520photography%252C%2520daytime%252C%2520no%2520people&width=400&height=300&seq=1&orientation=landscape',
      ),
      _RecentPlace(
        name: '한식당 미소',
        date: '2025년 5월 17일',
        desc: '대전시 중구에 위치한 프리미엄 한식당. 제철 식재료로 만든 코스 요리가 일품입니다.',
        rating: 4.6,
        category: '한식 · 파인다이닝',
        imageUrl:
            'https://readdy.ai/api/search-image?query=modern%2520Korean%2520restaurant%2520interior%2520with%2520traditional%2520elements%252C%2520elegant%2520table%2520settings%252C%2520warm%2520lighting%252C%2520sophisticated%2520atmosphere%252C%2520high%2520quality%2520photography%252C%2520evening%2520ambiance%252C%2520no%2520people&width=400&height=300&seq=2&orientation=landscape',
      ),
      _RecentPlace(
        name: '북스테이 이야기',
        date: '2025년 5월 15일',
        desc: '대전시 서구에 위치한 복합문화공간. 다양한 독립출판물과 커피, 디저트를 즐길 수 있는 아늑한 공간입니다.',
        rating: 4.7,
        category: '서점 · 카페',
        imageUrl:
            'https://readdy.ai/api/search-image?query=modern%2520bookstore%2520cafe%2520with%2520bookshelves%252C%2520comfortable%2520seating%252C%2520warm%2520lighting%252C%2520cozy%2520reading%2520spaces%252C%2520high%2520quality%2520photography%252C%2520daytime%252C%2520minimal%2520people&width=400&height=300&seq=3&orientation=landscape',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '최근 방문 장소',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
        itemCount: places.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, idx) {
          final place = places[idx];
          return GestureDetector(
            onTap: () {
              // TODO: 상세 페이지 이동 구현
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      place.imageUrl,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              place.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              place.date,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          place.desc,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: primaryColor,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              place.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 1,
                              height: 14,
                              color: Color(0xFFE5E7EB),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              place.category,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 2,
        onTap: (idx) {
          if (idx == 0) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/home', (route) => false);
          } else if (idx == 1) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/search', (route) => false);
          } else if (idx == 2) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/mypage', (route) => false);
          }
        },
      ),
    );
  }
}

class _RecentPlace {
  final String name;
  final String date;
  final String desc;
  final double rating;
  final String category;
  final String imageUrl;
  _RecentPlace({
    required this.name,
    required this.date,
    required this.desc,
    required this.rating,
    required this.category,
    required this.imageUrl,
  });
}
