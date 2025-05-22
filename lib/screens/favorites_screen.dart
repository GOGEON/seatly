import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<_Place> _places = [
    _Place(
      name: '한정담',
      category: '한식 • 중구',
      imageUrl:
          'https://readdy.ai/api/search-image?query=Korean%2520traditional%2520restaurant%2520interior%2520with%2520wooden%2520tables%2520and%2520warm%2520lighting%2C%2520cozy%2520atmosphere%2C%2520high-quality%2520professional%2520photo&width=200&height=200&seq=1&orientation=squarish',
      rating: 4.8,
      reviews: 324,
    ),
    _Place(
      name: '라 피아짜',
      category: '이탈리안 • 서구',
      imageUrl:
          'https://readdy.ai/api/search-image?query=Luxury%2520Italian%2520restaurant%2520with%2520pasta%2520dishes%2C%2520elegant%2520table%2520setting%2C%2520ambient%2520lighting%2C%2520professional%2520food%2520photography&width=200&height=200&seq=3&orientation=squarish',
      rating: 4.7,
      reviews: 289,
    ),
    _Place(
      name: '스시 오마카세',
      category: '일식 • 유성구',
      imageUrl:
          'https://readdy.ai/api/search-image?query=Japanese%2520sushi%2520restaurant%2520with%2520traditional%2520decor%2C%2520sushi%2520bar%2C%2520chef%2520preparing%2520food%2C%2520professional%2520photo&width=200&height=200&seq=4&orientation=squarish',
      rating: 4.9,
      reviews: 176,
    ),
    _Place(
      name: '브루어리 펍',
      category: '펍 • 대덕구',
      imageUrl:
          'https://readdy.ai/api/search-image?query=Craft%2520beer%2520pub%2520with%2520wooden%2520interior%2C%2520beer%2520taps%2C%2520glasses%2520of%2520beer%2C%2520cozy%2520atmosphere%2C%2520professional%2520photo&width=200&height=200&seq=6&orientation=squarish',
      rating: 4.4,
      reviews: 318,
    ),
    _Place(
      name: '타르틴 베이커리',
      category: '베이커리 • 중구',
      imageUrl:
          'https://readdy.ai/api/search-image?query=Modern%2520bakery%2520with%2520fresh%2520bread%2C%2520pastries%2C%2520display%2520counter%2C%2520bright%2520interior%2C%2520professional%2520photo&width=200&height=200&seq=7&orientation=squarish',
      rating: 4.7,
      reviews: 256,
    ),
    _Place(
      name: '스카이 라운지',
      category: '루프탑 바 • 서구',
      imageUrl:
          'https://readdy.ai/api/search-image?query=Rooftop%2520bar%2520with%2520city%2520skyline%2520view%2C%2520cocktails%2C%2520lounge%2520seating%2C%2520evening%2520atmosphere%2C%2520professional%2520photo&width=200&height=200&seq=8&orientation=squarish',
      rating: 4.6,
      reviews: 412,
    ),
    _Place(
      name: '달콤 디저트',
      category: '디저트 카페 • 유성구',
      imageUrl:
          'https://readdy.ai/api/search-image?query=Dessert%2520cafe%2520with%2520colorful%2520macarons%2C%2520cakes%2C%2520elegant%2520interior%2C%2520pastel%2520colors%2C%2520professional%2520photo&width=200&height=200&seq=9&orientation=squarish',
      rating: 4.5,
      reviews: 287,
    ),
    _Place(
      name: '방콕 스트리트',
      category: '태국 음식 • 대덕구',
      imageUrl:
          'https://readdy.ai/api/search-image?query=Thai%2520restaurant%2520with%2520authentic%2520dishes%2C%2520colorful%2520decor%2C%2520spices%2C%2520professional%2520food%2520photography&width=200&height=200&seq=10&orientation=squarish',
      rating: 4.3,
      reviews: 198,
    ),
  ];

  int? _pendingRemoveIndex;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFCFA857);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '즐겨찾기한 장소',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body:
          _places.isEmpty
              ? const Center(
                child: Text(
                  '즐겨찾기한 장소가 없습니다.',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
              : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                itemCount: _places.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, idx) {
                  final place = _places[idx];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    height: _pendingRemoveIndex == idx ? 0 : null,
                    child: Opacity(
                      opacity: _pendingRemoveIndex == idx ? 0 : 1,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: 상세 페이지 이동 구현
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                // 이미지 정상 출력으로 복원
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    place.imageUrl,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        place.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        place.category,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 2),
                                          Text(
                                            '${place.rating.toStringAsFixed(1)} (${place.reviews})',
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: primaryColor,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    // 삭제/해제 동작 없이 아무 일도 하지 않음 (항상 리스트가 보이게)
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
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

class _Place {
  final String name;
  final String category;
  final String imageUrl;
  final double rating;
  final int reviews;
  _Place({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
  });
}
