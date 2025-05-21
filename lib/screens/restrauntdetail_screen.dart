import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  int selectedDateIndex = 1;
  int selectedTimeIndex = 3;
  int? selectedTable;
  int selectedTabIndex = 0;

  final List<Map<String, String>> dates = [
    {'label': '오늘', 'date': '5/15', 'weekday': '목'},
    {'label': '내일', 'date': '5/16', 'weekday': '금'},
    {'label': '모레', 'date': '5/17', 'weekday': '토'},
    {'label': '', 'date': '5/18', 'weekday': '일'},
    {'label': '', 'date': '5/19', 'weekday': '월'},
    {'label': '', 'date': '5/20', 'weekday': '화'},
  ];

  final List<Map<String, String>> timeSlots = [
    {'time': '11:30', 'remaining': '8석 남음'},
    {'time': '12:00', 'remaining': '5석 남음'},
    {'time': '12:30', 'remaining': '2석 남음'},
    {'time': '13:00', 'remaining': '10석 남음'},
    {'time': '13:30', 'remaining': '12석 남음'},
    {'time': '18:00', 'remaining': '6석 남음'},
    {'time': '18:30', 'remaining': '4석 남음'},
    {'time': '19:00', 'remaining': '마감'},
    {'time': '19:30', 'remaining': '3석 남음'},
  ];

  final List<String> tabLabels = ['메뉴', '좌석배치도', '정보', '리뷰'];

  @override
  Widget build(BuildContext context) {
    final selectedDate = dates[selectedDateIndex]['date'];
    final selectedTime = timeSlots[selectedTimeIndex]['time'];
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF8B7355)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('라 피아짜', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Color(0xFF8B7355)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 이미지
                  SizedBox(
                    height: 250,
                    child: Stack(
                      children: [
                        Image.network(
                          'https://readdy.ai/api/search-image?query=elegant%2520italian%2520restaurant%2520interior%2520with%2520rustic%2520wooden%2520tables%2C%2520warm%2520ambient%2520lighting%2C%2520wine%2520bottles%2520on%2520display%2C%2520pizza%2520oven%2520in%2520background%2C%2520authentic%2520italian%2520atmosphere%2C%2520high-end%2520dining%2520experience&width=375&height=250&seq=101&orientation=landscape',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 12,
                          right: 16,
                          child: Row(
                            children: [
                              _dot(false),
                              _dot(true),
                              _dot(false),
                              _dot(false),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 기본 정보
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
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
                                const Text(
                                  '라 피아짜',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(
                                        4,
                                        (i) => const Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Color(0xFFFFD700),
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.star_half,
                                      size: 14,
                                      color: Color(0xFFFFD700),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      '4.7 (156)',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  children: const [
                                    Chip(
                                      label: Text('이탈리안'),
                                      backgroundColor: Color(0xFFF3F4F6),
                                    ),
                                    Chip(
                                      label: Text('파스타'),
                                      backgroundColor: Color(0xFFF3F4F6),
                                    ),
                                    Chip(
                                      label: Text('피자'),
                                      backgroundColor: Color(0xFFF3F4F6),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '대전 중구 은행동 123-45',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // 예약 가능 시간
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '예약 가능 시간',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // 날짜 선택
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(dates.length, (index) {
                              final date = dates[index];
                              final selected = index == selectedDateIndex;
                              return GestureDetector(
                                onTap:
                                    () => setState(
                                      () => selectedDateIndex = index,
                                    ),
                                child: Container(
                                  width: 64,
                                  height: 80,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color:
                                        selected
                                            ? const Color(0xFFCFA857)
                                            : const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        date['label'] ?? '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              selected
                                                  ? Colors.white
                                                  : Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        date['date'] ?? '',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              selected
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        date['weekday'] ?? '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              selected
                                                  ? Colors.white
                                                  : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${dates[selectedDateIndex]['date']} 예약 가능 시간',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 3 / 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(timeSlots.length, (index) {
                            final slot = timeSlots[index];
                            final selected = index == selectedTimeIndex;
                            return GestureDetector(
                              onTap:
                                  () =>
                                      setState(() => selectedTimeIndex = index),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      selected
                                          ? const Color(0xFFCFA857)
                                          : const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      slot['time']!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            selected
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      slot['remaining']!,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            selected
                                                ? Colors.white
                                                : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  // 탭 메뉴
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: List.generate(tabLabels.length, (i) {
                            final selected = i == selectedTabIndex;
                            return Expanded(
                              child: GestureDetector(
                                onTap:
                                    () => setState(() => selectedTabIndex = i),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color:
                                            selected
                                                ? const Color(0xFFCFA857)
                                                : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      tabLabels[i],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            selected
                                                ? const Color(0xFF8B7355)
                                                : Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        if (selectedTabIndex == 0) ..._buildMenuTab(),
                        if (selectedTabIndex == 1) ..._buildSeatingTab(),
                        if (selectedTabIndex == 2) ..._buildInfoTab(),
                        if (selectedTabIndex == 3) ..._buildReviewsTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 하단 예약 버튼
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCFA857),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text('$selectedDate $selectedTime 예약하기'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(bool active) => Container(
    width: 8,
    height: 8,
    margin: const EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
      color: active ? Colors.white : Colors.white.withOpacity(0.5),
      shape: BoxShape.circle,
    ),
  );

  List<Widget> _buildMenuTab() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '대표 메뉴',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            _buildMenuItem(
              'https://readdy.ai/api/search-image?query=authentic%2520Italian%2520margherita%2520pizza%2520with%2520fresh%2520basil%2C%2520mozzarella%2520cheese%2C%2520tomato%2520sauce%2C%2520wood-fired%2520crust%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=80&height=80&seq=102&orientation=squarish',
              '마르게리타 피자',
              '토마토 소스, 모짜렐라 치즈, 바질',
              '18,000원',
            ),
            _buildMenuItem(
              'https://readdy.ai/api/search-image?query=Italian%2520carbonara%2520pasta%2520with%2520pancetta%2C%2520egg%2520yolk%2C%2520parmesan%2520cheese%2C%2520black%2520pepper%2C%2520perfectly%2520cooked%2520spaghetti%2C%2520creamy%2520sauce%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=80&height=80&seq=103&orientation=squarish',
              '카르보나라',
              '판체타, 계란 노른자, 파마산 치즈',
              '16,000원',
            ),
            _buildMenuItem(
              'https://readdy.ai/api/search-image?query=Italian%2520tiramisu%2520dessert%2520with%2520layers%2520of%2520mascarpone%2520cream%2C%2520coffee-soaked%2520ladyfingers%2C%2520cocoa%2520powder%2520on%2520top%2C%2520served%2520in%2520elegant%2520glass%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=80&height=80&seq=104&orientation=squarish',
              '티라미수',
              '마스카포네 크림, 커피, 코코아 파우더',
              '8,000원',
            ),
            _buildMenuItem(
              'https://readdy.ai/api/search-image?query=Italian%2520seafood%2520risotto%2520with%2520shrimp%2C%2520mussels%2C%2520calamari%2C%2520saffron%2C%2520parmesan%2520cheese%2C%2520creamy%2520texture%2C%2520garnished%2520with%2520fresh%2520herbs%2C%2520high-quality%2520food%2520photography%2C%2520isolated%2520on%2520white%2520background&width=80&height=80&seq=105&orientation=squarish',
              '해산물 리조또',
              '새우, 홍합, 오징어, 샤프란',
              '19,000원',
            ),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  '전체 메뉴 보기',
                  style: TextStyle(color: Color(0xFFCFA857)),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _buildMenuItem(
    String imageUrl,
    String title,
    String desc,
    String price,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSeatingTab() {
    // 좌석배치도, 좌석 정보, 구역 설명, 범례, 좌석 선택 버튼
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '좌석배치도',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '전체 보기',
                    style: TextStyle(fontSize: 14, color: Color(0xFFCFA857)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFF3F4F6)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://readdy.ai/api/search-image?query=restaurant%2520floor%2520plan%2520layout%2520diagram%2C%2520top%2520view%2C%2520showing%2520tables%2C%2520chairs%2C%2520bar%2520area%2C%2520entrance%2C%2520kitchen%2C%2520restrooms%2C%2520clean%2520design%2520with%2520labels%2C%2520blueprint%2520style%2C%2520professional%2520restaurant%2520seating%2520chart&width=375&height=250&seq=106&orientation=landscape',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // 실제 좌석 위젯은 생략, 예시용
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _legendDot(Colors.green, '이용 가능'),
                const SizedBox(width: 12),
                _legendDot(Colors.red, '예약됨'),
                const SizedBox(width: 12),
                _legendDot(Colors.yellow, '선택됨'),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCFA857),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text('좌석 선택하기'),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  List<Widget> _buildInfoTab() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '영업 시간',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text('월요일 - 금요일: 11:30 - 22:00'),
            Text('토요일: 11:30 - 23:00'),
            Text('일요일: 12:00 - 21:00'),
            Text(
              '* 브레이크 타임: 15:00 - 17:00',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              '위치 정보',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text('대전 중구 은행동 123-45'),
            SizedBox(height: 8),
            Text(
              '편의 시설',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text('무료 와이파이, 주차 가능, 장애인 접근성, 카드 결제'),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildReviewsTab() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '리뷰 156개',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text('4.7점 (156명)'),
            SizedBox(height: 8),
            Text(
              '정통 이탈리안 요리를 즐길 수 있는 곳입니다. 마르게리타 피자가 정말 맛있었어요! 도우가 쫄깃하고 토핑이 신선해요. 분위기도 로맨틱해서 데이트 코스로 추천합니다.',
            ),
          ],
        ),
      ),
    ];
  }
}
