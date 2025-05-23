import 'package:flutter/material.dart';

// 전체 메뉴 탭 위젯 (파일 최상단에 선언)
class FullMenuTab extends StatefulWidget {
  const FullMenuTab({Key? key}) : super(key: key);
  @override
  State<FullMenuTab> createState() => _FullMenuTabState();
}

class _FullMenuTabState extends State<FullMenuTab> {
  final List<String> categories = [
    '전체',
    '피자',
    '파스타',
    '리조또',
    '샐러드',
    '디저트',
    '음료',
  ];
  String selectedCategory = '전체';

  final List<Map<String, String>> menuItems = [
    // 피자
    {
      'name': '마르게리타 피자',
      'category': '피자',
      'price': '18,000원',
      'desc': '토마토 소스, 모짜렐라 치즈, 바질로 만든 클래식한 이탈리안 피자',
      'image':
          'https://readdy.ai/api/search-image?query=authentic%2520Italian%2520margherita%2520pizza%2520with%2520fresh%2520basil%2C%2520mozzarella%2520cheese%2C%2520tomato%2520sauce%2C%2520wood-fired%2520crust%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background%2C%2520professional%2520lighting&width=180&height=144&seq=201&orientation=squarish',
    },
    {
      'name': '콰트로 포르마지',
      'category': '피자',
      'price': '22,000원',
      'desc': '네 가지 치즈(모짜렐라, 고르곤졸라, 파마산, 리코타)의 풍미',
      'image':
          'https://readdy.ai/api/search-image?query=authentic%2520Italian%2520quattro%2520formaggi%2520pizza%2520with%2520four%2520cheeses%2C%2520wood-fired%2520crust%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background%2C%2520professional%2520lighting&width=180&height=144&seq=202&orientation=squarish',
    },
    {
      'name': '페퍼로니 피자',
      'category': '피자',
      'price': '20,000원',
      'desc': '매콤한 페퍼로니 살라미와 풍부한 모짜렐라 치즈의 조화',
      'image':
          'https://readdy.ai/api/search-image?query=authentic%2520Italian%2520pepperoni%2520pizza%2520with%2520spicy%2520salami%2C%2520mozzarella%2520cheese%2C%2520tomato%2520sauce%2C%2520wood-fired%2520crust%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=203&orientation=squarish',
    },
    {
      'name': '프로슈토 피자',
      'category': '피자',
      'price': '23,000원',
      'desc': '이탈리안 생햄과 루꼴라, 파마산 치즈가 어우러진 고급 피자',
      'image':
          'https://readdy.ai/api/search-image?query=authentic%2520Italian%2520prosciutto%2520pizza%2520with%2520arugula%2C%2520parmesan%2520cheese%2C%2520tomato%2520sauce%2C%2520wood-fired%2520crust%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=204&orientation=squarish',
    },
    // 파스타
    {
      'name': '카르보나라',
      'category': '파스타',
      'price': '16,000원',
      'desc': '판체타, 계란 노른자, 파마산 치즈로 만든 크리미한 파스타',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520carbonara%2520pasta%2520with%2520pancetta%2C%2520egg%2520yolk%2C%2520parmesan%2520cheese%2C%2520black%2520pepper%2C%2520perfectly%2520cooked%2520spaghetti%2C%2520creamy%2520sauce%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=205&orientation=squarish',
    },
    {
      'name': '볼로네제',
      'category': '파스타',
      'price': '17,000원',
      'desc': '소고기와 토마토 소스로 오랜 시간 끓인 정통 이탈리안 미트 소스',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520bolognese%2520pasta%2520with%2520rich%2520meat%2520sauce%2C%2520parmesan%2520cheese%2C%2520perfectly%2520cooked%2520spaghetti%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=206&orientation=squarish',
    },
    {
      'name': '해산물 파스타',
      'category': '파스타',
      'price': '19,000원',
      'desc': '새우, 홍합, 조개, 오징어 등 신선한 해산물이 풍부한 파스타',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520seafood%2520pasta%2520with%2520shrimp%2C%2520mussels%2C%2520clams%2C%2520squid%2C%2520tomato%2520sauce%2C%2520white%2520wine%2C%2520perfectly%2520cooked%2520linguine%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=207&orientation=squarish',
    },
    {
      'name': '페스토 파스타',
      'category': '파스타',
      'price': '16,000원',
      'desc': '신선한 바질, 잣, 파마산 치즈, 올리브 오일로 만든 그린 소스',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520pesto%2520pasta%2520with%2520fresh%2520basil%2C%2520pine%2520nuts%2C%2520parmesan%2520cheese%2C%2520olive%2520oil%2C%2520perfectly%2520cooked%2520fusilli%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=208&orientation=squarish',
    },
    // 리조또
    {
      'name': '해산물 리조또',
      'category': '리조또',
      'price': '19,000원',
      'desc': '새우, 홍합, 오징어, 샤프란으로 맛을 낸 크리미한 리조또',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520seafood%2520risotto%2520with%2520shrimp%2C%2520mussels%2C%2520calamari%2C%2520saffron%2C%2520parmesan%2520cheese%2C%2520creamy%2520texture%2C%2520garnished%2520with%2520fresh%2520herbs%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=209&orientation=squarish',
    },
    {
      'name': '버섯 리조또',
      'category': '리조또',
      'price': '18,000원',
      'desc': '포르치니, 표고, 양송이 등 다양한 버섯의 풍미가 가득한 리조또',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520mushroom%2520risotto%2520with%2520porcini%2C%2520shiitake%2C%2520button%2520mushrooms%2C%2520parmesan%2520cheese%2C%2520truffle%2520oil%2C%2520creamy%2520texture%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=210&orientation=squarish',
    },
    {
      'name': '트러플 리조또',
      'category': '리조또',
      'price': '25,000원',
      'desc': '블랙 트러플과 파마산 치즈의 고급스러운 풍미가 어우러진 리조또',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520truffle%2520risotto%2520with%2520black%2520truffle%2C%2520parmesan%2520cheese%2C%2520butter%2C%2520creamy%2520texture%2C%2520garnished%2520with%2520truffle%2520slices%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=211&orientation=squarish',
    },
    // 샐러드
    {
      'name': '카프레제 샐러드',
      'category': '샐러드',
      'price': '14,000원',
      'desc': '신선한 모짜렐라, 토마토, 바질, 발사믹 글레이즈의 클래식한 조합',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520caprese%2520salad%2520with%2520fresh%2520mozzarella%2C%2520tomatoes%2C%2520basil%2C%2520olive%2520oil%2C%2520balsamic%2520glaze%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=212&orientation=squarish',
    },
    {
      'name': '시저 샐러드',
      'category': '샐러드',
      'price': '15,000원',
      'desc': '로메인 상추, 크루통, 파마산 치즈, 그릴드 치킨과 시저 드레싱',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520caesar%2520salad%2520with%2520romaine%2520lettuce%2C%2520croutons%2C%2520parmesan%2520cheese%2C%2520caesar%2520dressing%2C%2520grilled%2520chicken%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=213&orientation=squarish',
    },
    {
      'name': '루꼴라 샐러드',
      'category': '샐러드',
      'price': '16,000원',
      'desc': '루꼴라, 프로슈토, 파마산 치즈, 잣과 발사믹 드레싱의 고급스러운 맛',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520arugula%2520salad%2520with%2520prosciutto%2C%2520parmesan%2520cheese%2C%2520pine%2520nuts%2C%2520balsamic%2520dressing%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=214&orientation=squarish',
    },
    // 디저트
    {
      'name': '티라미수',
      'category': '디저트',
      'price': '8,000원',
      'desc': '마스카포네 크림, 커피에 적신 레이디핑거, 코코아 파우더의 조화',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520tiramisu%2520dessert%2520with%2520layers%2520of%2520mascarpone%2520cream%2C%2520coffee-soaked%2520ladyfingers%2C%2520cocoa%2520powder%2520on%2520top%2C%2520served%2520in%2520elegant%2520glass%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=215&orientation=squarish',
    },
    {
      'name': '판나코타',
      'category': '디저트',
      'price': '7,000원',
      'desc': '부드러운 바닐라 크림과 베리 쿨리스, 신선한 베리로 장식한 이탈리안 디저트',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520panna%2520cotta%2520dessert%2520with%2520vanilla%2520cream%2C%2520berry%2520coulis%2C%2520fresh%2520berries%2C%2520mint%2520garnish%2C%2520served%2520in%2520elegant%2520glass%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=216&orientation=squarish',
    },
    {
      'name': '카놀리',
      'category': '디저트',
      'price': '9,000원',
      'desc': '바삭한 튜브 페이스트리에 달콤한 리코타 치즈 필링을 채운 시칠리아 디저트',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520cannoli%2520dessert%2520with%2520crispy%2520pastry%2520tubes%2C%2520sweet%2520ricotta%2520filling%2C%2520chocolate%2520chips%2C%2520powdered%2520sugar%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=217&orientation=squarish',
    },
    // 음료
    {
      'name': '에스프레소',
      'category': '음료',
      'price': '4,000원',
      'desc': '진한 풍미의 정통 이탈리안 에스프레소',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520espresso%2520coffee%2520in%2520small%2520cup%2C%2520crema%2520on%2520top%2C%2520served%2520with%2520small%2520biscotti%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=218&orientation=squarish',
    },
    {
      'name': '카푸치노',
      'category': '음료',
      'price': '5,000원',
      'desc': '에스프레소, 스팀 밀크, 밀크 폼의 완벽한 비율로 만든 클래식 카푸치노',
      'image':
          "https://readdy.ai/api/search-image?query=Italian%2520cappuccino%2520coffee%2520with%2520espresso%2C%2520steamed%2520milk%2C%2520milk%2520foam%2C%2520cocoa%2520powder%2520on%2520top%2C%2520served%2520in%2520white%2520cup%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=219&orientation=squarish",
    },
    {
      'name': '레드 와인',
      'category': '음료',
      'price': '9,000원',
      'desc': '이탈리아 토스카나 지역의 풍부한 바디감의 레드 와인',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520red%2520wine%2520in%2520elegant%2520glass%2C%2520bottle%2520in%2520background%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=220&orientation=squarish',
    },
    {
      'name': '스파클링 워터',
      'category': '음료',
      'price': '3,000원',
      'desc': '이탈리아 산 페레그리노 탄산수',
      'image':
          'https://readdy.ai/api/search-image?query=Italian%2520sparkling%2520water%2520in%2520elegant%2520glass%2C%2520bottle%2520in%2520background%2C%2520bubbles%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=180&height=144&seq=221&orientation=squarish',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered =
        menuItems.where((item) {
          final matchCategory =
              selectedCategory == '전체' || item['category'] == selectedCategory;
          return matchCategory;
        }).toList();

    return Stack(
      children: [
        Column(
          children: [
            // 메뉴 리스트
            Expanded(
              child:
                  filtered.isEmpty
                      ? const Center(
                        child: Text(
                          '해당 카테고리의 메뉴가 없습니다.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                      : ListView(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        children: [..._buildMenuSections(filtered)],
                      ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildMenuSections(List<Map<String, String>> items) {
    // 카테고리별 그룹핑
    final Map<String, List<Map<String, String>>> grouped = {};
    for (final item in items) {
      final cat = item['category']!;
      if (selectedCategory == '전체' || cat == selectedCategory) {
        grouped.putIfAbsent(cat, () => []).add(item);
      }
    }
    final order = ['피자', '파스타', '리조또', '샐러드', '디저트', '음료'];
    return [
      for (final cat in order)
        if (grouped.containsKey(cat))
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cat,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: grouped[cat]!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, idx) {
                    final item = grouped[cat]![idx];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.network(
                              item['image']!,
                              height: 110,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['desc']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['price']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFCFA857),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
    ];
  }
}

class SeatScreen extends StatefulWidget {
  final int initialTab;
  const SeatScreen({Key? key, this.initialTab = 1}) : super(key: key);

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  late int selectedTab;
  int? selectedSeat;
  bool showReservationModal = false;

  // 좌석 선택 상태 변수 추가
  List<bool>? _selectedSeats;
  // 선택된 테이블에 따른 이미지 리스트
  List<String> _selectedTableImages = [];

  // 테이블별 좌석 인덱스 매핑
  final Map<int, List<int>> tableSeatIndices = {
    1: [0, 1, 2, 3],
    2: [4, 5, 6, 7],
    3: [8, 9, 10, 11],
    4: [12, 13, 14, 15],
    5: [16, 17, 18, 19],
    6: [20, 21, 22, 23],
    7: [24, 25, 26, 27],
    8: [28, 29, 30, 31],
  };

  // 좌석 인덱스 → 테이블 번호
  int? _seatToTable(int seatIdx) {
    for (final entry in tableSeatIndices.entries) {
      if (entry.value.contains(seatIdx)) return entry.key;
    }
    return null;
  }

  void _updateSelectedTableImages() {
    final Set<int> selectedTables = {};
    for (int i = 0; i < _selectedSeats!.length; i++) {
      if (_selectedSeats![i]) {
        final t = _seatToTable(i);
        if (t != null) selectedTables.add(t);
      }
    }
    final List<String> images = [];
    if (selectedTables.contains(1) || selectedTables.contains(2)) {
      images.add('assets/terraces.jpg');
    }
    if (selectedTables.contains(3) || selectedTables.contains(6)) {
      images.add('assets/bar.jpg');
    }
    if (selectedTables.contains(8)) {
      images.add('assets/kitchen.jpg');
    }
    _selectedTableImages = images;
  }

  @override
  void initState() {
    super.initState();
    selectedTab = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFCFA857);
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('라 피아짜', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 탭 메뉴
          Container(
            color: Colors.white,
            child: Row(
              children: [
                _tabButton('메뉴', 0),
                _tabButton('좌석배치도', 1),
                _tabButton('정보', 2),
                _tabButton('리뷰', 3),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedTab,
              children: [
                // 메뉴 탭
                _buildMenuTab(primaryColor),
                _buildSeatingTab(primaryColor),
                _buildInfoTab(primaryColor),
                _buildReviewTab(primaryColor),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildReserveButton(primaryColor),
    );
  }

  Widget _tabButton(String label, int idx) {
    const primaryColor = Color(0xFFCFA857);
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedTab = idx),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selectedTab == idx ? primaryColor : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: selectedTab == idx ? primaryColor : Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTab(Color primaryColor) {
    return const FullMenuTab();
  }

  Widget _buildSeatingTab(Color primaryColor) {
    // 좌석 위치 및 상태 관리 (32개 좌표, assets/seatingmap.png에 맞게 예시 배치)
    final List<Offset> seatPositions = [
      // 1번 테이블 (좌상단)
      const Offset(0.12, -0.04),
      const Offset(0.19, -0.04),
      const Offset(0.12, 0.15),
      const Offset(0.19, 0.15),
      // 2번 테이블 (1번 테이블 오른쪽)
      const Offset(0.35, -0.02),
      const Offset(0.42, -0.02),
      const Offset(0.35, 0.17),
      const Offset(0.42, 0.17),
      // 3번 테이블 (2번 테이블 오른쪽)
      const Offset(0.56, -0.02),
      const Offset(0.63, -0.02),
      const Offset(0.56, 0.17),
      const Offset(0.63, 0.17),

      // 4번 테이블 (1번 테이블 아래)
      const Offset(0.12, 0.25),
      const Offset(0.19, 0.25),
      const Offset(0.12, 0.44),
      const Offset(0.19, 0.44),
      // 5번 테이블 (2번 테이블 아래)
      const Offset(0.35, 0.30),
      const Offset(0.42, 0.30),
      const Offset(0.35, 0.47),
      const Offset(0.42, 0.47),
      // 6번 테이블 (3번 테이블 아래)
      const Offset(0.56, 0.30),
      const Offset(0.63, 0.30),
      const Offset(0.56, 0.47),
      const Offset(0.63, 0.47),

      // 7번 테이블 (하단)
      const Offset(0.34, 0.82),
      const Offset(0.45, 0.82),
      const Offset(0.34, 0.95),
      const Offset(0.45, 0.95),
      // 8번 테이블 (7번 테이블 오른쪽)
      const Offset(0.51, 0.82),
      const Offset(0.62, 0.82),
      const Offset(0.51, 0.95),
      const Offset(0.62, 0.95),
    ];
    final double seatImageHeight = 220 * 2;
    if (_selectedSeats == null ||
        _selectedSeats!.length != seatPositions.length) {
      _selectedSeats = List.generate(seatPositions.length, (i) => false);
    }
    _updateSelectedTableImages();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '좌석배치도',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            constraints: const BoxConstraints(minHeight: 400),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE5E7EB)),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                  height: seatImageHeight,
                  width: double.infinity,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final w = constraints.maxWidth;
                      final h = seatImageHeight;
                      // 이미지 원본 비율 (assets/seatingmap.png가 1280x720 기준)
                      const imgW = 1280.0;
                      const imgH = 720.0;
                      final imgRatio = imgW / imgH;
                      // 실제로 화면에 표시되는 이미지 크기 계산 (BoxFit.contain)
                      double shownW, shownH, shownLeft, shownTop;
                      if (w / h > imgRatio) {
                        // 세로가 기준, 좌우 여백 생김
                        shownH = h;
                        shownW = h * imgRatio;
                        shownLeft = (w - shownW) / 2;
                        shownTop = 0;
                      } else {
                        // 가로가 기준, 상하 여백 생김
                        shownW = w;
                        shownH = w / imgRatio;
                        shownLeft = 0;
                        shownTop = (h - shownH) / 2;
                      }
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/seatingmap.png',
                                height: seatImageHeight,
                                width: w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          for (int i = 0; i < seatPositions.length; i++)
                            Positioned(
                              left:
                                  shownLeft + seatPositions[i].dx * shownW - 11,
                              top: shownTop + seatPositions[i].dy * shownH - 11,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedSeats![i] = !_selectedSeats![i];
                                    _updateSelectedTableImages();
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color:
                                        _selectedSeats![i]
                                            ? Colors.yellow[700]
                                            : Colors.green,
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(
                                      6,
                                    ), // 사각형(둥근 모서리)
                                  ),
                                  child: const SizedBox.shrink(),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _legendDot(Colors.green),
                    const SizedBox(width: 6),
                    const Text('이용 가능 좌석', style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 16),
                    _legendDot(Colors.red),
                    const SizedBox(width: 6),
                    const Text('예약된 좌석', style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 16),
                    _legendDot(Colors.yellow[700]!),
                    const SizedBox(width: 6),
                    const Text('선택한 좌석', style: TextStyle(fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 16),
                if (_selectedTableImages.isNotEmpty)
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedTableImages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, idx) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            _selectedTableImages[idx],
                            width: 140,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                if (_selectedTableImages.isNotEmpty) const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendDot(Color color) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4), // 네모(둥근 사각형)
      ),
    );
  }

  Widget _buildInfoTab(Color primaryColor) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '영업 시간',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE5E7EB)),
            ),
            child: Column(
              children: const [
                _InfoRow('월요일 - 금요일', '11:30 - 22:00'),
                _InfoRow('토요일', '11:30 - 23:00'),
                _InfoRow('일요일', '12:00 - 21:00'),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '* 브레이크 타임: 15:00 - 17:00',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '위치 정보',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://public.readdy.ai/gen_page/map_placeholder_1280x720.png',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          const Text('대전 중구 은행동 123-45', style: TextStyle(fontSize: 13)),
          const SizedBox(height: 8),
          Row(
            children: [
              _infoButton(Icons.map, '길찾기'),
              const SizedBox(width: 8),
              _infoButton(Icons.phone, '전화하기'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '편의 시설',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: const [
              _Facility(icon: Icons.wifi, label: '무료 와이파이'),
              _Facility(icon: Icons.local_parking, label: '주차 가능'),
              _Facility(icon: Icons.accessible, label: '장애인 접근성'),
              _Facility(icon: Icons.credit_card, label: '카드 결제'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: const Color(0xFFCFA857), size: 18),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black87, fontSize: 13),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFE5E7EB)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: const Color(0xFFF3F4F6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _buildReviewTab(Color primaryColor) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '리뷰 156개',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(
                onPressed: () {},
                child: Text('리뷰 작성', style: TextStyle(color: primaryColor)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                '4.7',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    _reviewBar(5, 0.85),
                    _reviewBar(4, 0.10),
                    _reviewBar(3, 0.03),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _reviewItem(
            name: '김지연',
            date: '2025.05.10',
            rating: 5,
            content:
                '정통 이탈리안 요리를 즐길 수 있는 곳입니다. 마르게리타 피자가 정말 맛있었어요! 도우가 쫄깃하고 토핑이 신선해요. 분위기도 로맨틱해서 데이트 코스로 추천합니다.',
            profileUrl:
                'https://readdy.ai/api/search-image?query=profile%2520picture%2520of%2520young%2520Asian%2520woman%2C%2520professional%2520headshot%2C%2520neutral%2520background%2C%2520friendly%2520smile%2C%2520casual%2520attire&width=40&height=40&seq=107&orientation=squarish',
          ),
          _reviewItem(
            name: '박성민',
            date: '2025.05.05',
            rating: 4,
            content:
                '해산물 리조또가 일품입니다. 샤프란 향이 은은하게 퍼지고 해산물이 신선해요. 다만 주말에는 사람이 많아 예약이 필수입니다. 서비스는 친절하지만 가격대가 조금 있는 편이에요.',
            profileUrl:
                'https://readdy.ai/api/search-image?query=profile%2520picture%2520of%2520middle-aged%2520Asian%2520man%2C%2520professional%2520headshot%2C%2520neutral%2520background%2C%2520confident%2520expression%2C%2520business%2520casual%2520attire&width=40&height=40&seq=108&orientation=squarish',
          ),
          _reviewItem(
            name: '이준호',
            date: '2025.04.28',
            rating: 4.5,
            content:
                '카르보나라가 정말 맛있어요! 크림이 너무 느끼하지 않고 판체타의 짭짤한 맛이 잘 어우러집니다. 와인 페어링도 좋았어요. 직원분들이 와인에 대한 설명도 친절하게 해주셔서 좋은 경험이었습니다.',
            profileUrl:
                'https://readdy.ai/api/search-image?query=profile%2520picture%2520of%2520young%2520Asian%2520man%2C%2520professional%2520headshot%2C%2520neutral%2520background%2C%2520friendly%2520smile%2C%2520casual%2520attire&width=40&height=40&seq=109&orientation=squarish',
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFCFA857)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              '리뷰 더보기',
              style: TextStyle(color: Color(0xFFCFA857)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewBar(int star, double percent) {
    return Row(
      children: [
        Row(
          children: List.generate(
            star,
            (i) => const Icon(Icons.star, color: Colors.amber, size: 14),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percent,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _reviewItem({
    required String name,
    required String date,
    required double rating,
    required String content,
    required String profileUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              profileUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        rating.floor(),
                        (i) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                      ),
                    ),
                    if (rating - rating.floor() >= 0.5)
                      const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: 14,
                      ),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(content, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReserveButton(Color primaryColor) {
    // 예약 날짜/시간 동기화: RestaurantDetailScreen에서 전달받은 값 사용
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String? selectedDate = args != null ? args['selectedDate'] : null;
    final String? selectedTime = args != null ? args['selectedTime'] : null;
    final buttonText =
        (selectedDate != null && selectedTime != null)
            ? '$selectedDate $selectedTime 예약하기'
            : '예약하기';
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            setState(() => showReservationModal = true);
          },
          child: Text(
            buttonText,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String left;
  final String right;
  const _InfoRow(this.left, this.right);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: const TextStyle(fontSize: 13)),
          Text(right, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}

class _Facility extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Facility({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFFCFA857), size: 22),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
