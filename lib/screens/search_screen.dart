import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool hasSearched = false;

  List<String> recentKeywords = [
    '라 피아짜',
    '이탈리안 레스토랑',
    '도서관 스터디룸',
    '카페 창가 자리',
    '블루보틀',
  ];

  List<String> popularKeywords = [
    '이탈리안',
    '와인 바',
    '파인다이닝',
    '스터디룸',
    '블루보틀',
    '도서관',
    '대전역 근처',
    '24시간',
  ];

  void _handleSearch(String value) {
    if (value.trim().isEmpty) return;
    setState(() => hasSearched = true);
  }

  void _clearSearch() {
    _controller.clear();
    setState(() => hasSearched = false);
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFCFA857);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // 배경색 통일
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('검색', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          // 검색창
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: TextField(
              controller: _controller,
              onSubmitted: _handleSearch,
              decoration: InputDecoration(
                hintText: '장소 또는 좌석 검색',
                prefixIcon: const Icon(Icons.search),
                suffixIcon:
                    _controller.text.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: _clearSearch,
                        )
                        : null,
                filled: true,
                fillColor: const Color(0xFFF3F4F6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child:
                hasSearched
                    ? _buildSearchResults()
                    : _buildBeforeSearch(primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildBeforeSearch(Color primaryColor) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 최근 검색어
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최근 검색어',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => setState(() => recentKeywords.clear()),
                child: const Text(
                  '전체 삭제',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                recentKeywords
                    .map(
                      (keyword) => Chip(
                        label: Text(keyword),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted:
                            () =>
                                setState(() => recentKeywords.remove(keyword)),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 24),

          // 인기 검색어
          const Text('인기 검색어', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                popularKeywords
                    .asMap()
                    .entries
                    .map(
                      (entry) => Chip(
                        label: Text('#${entry.key + 1} ${entry.value}'),
                        backgroundColor:
                            entry.key < 3
                                ? primaryColor.withOpacity(0.1)
                                : const Color(0xFFF3F4F6),
                        labelStyle: TextStyle(
                          color: entry.key < 3 ? primaryColor : Colors.black87,
                        ),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 24),

          // 카테고리
          const Text('카테고리', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _categoryItem(Icons.restaurant, '레스토랑', primaryColor),
                _categoryItem(Icons.wine_bar, '와인 바'),
                _categoryItem(Icons.business, '공유 오피스'),
                _categoryItem(Icons.groups, '스터디룸'),
                _categoryItem(Icons.hotel, '휴게공간'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryItem(IconData icon, String label, [Color? color]) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: (color ?? Colors.grey[200])!.withOpacity(0.2),
            radius: 28,
            child: Icon(icon, color: color ?? Colors.grey[600], size: 28),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    final List<Map<String, dynamic>> results = [
      {
        'title': '스타벅스 대전역점',
        'subtitle': '대전 동구 · 카페',
        'rating': 4.0,
        'distance': '350m',
        'tags': ['콘센트', '와이파이', '창가석'],
        'desc': '창가 좌석과 콘센트가 충분한 넓은 공간의 스타벅스 매장.',
        'image':
            'https://readdy.ai/api/search-image?query=starbucks%2520cafe%2520interior...&width=400&height=200&seq=201',
      },
      {
        'title': '카페 드 파리',
        'subtitle': '서울 강남구 · 카페',
        'rating': 4.5,
        'distance': '500m',
        'tags': ['콘센트', '와이파이', '디저트'],
        'desc': '파리지앵 감성의 아늑한 카페. 창가 좌석이 인기',
        'image':
            'https://readdy.ai/api/search-image?query=modern%2520cafe...&width=400&seq=202',
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = results[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.network(
                  item['image'],
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item['subtitle'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${item['rating']} (${index * 100 + 100})',
                            style: const TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 14,
                                color: Colors.grey,
                              ),
                              Text(
                                item['distance'],
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['desc'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        children:
                            (item['tags'] as List<String>)
                                .map(
                                  (tag) => Chip(
                                    label: Text(
                                      tag,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    backgroundColor: const Color(0xFFF3F4F6),
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
