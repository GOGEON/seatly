import 'package:flutter/material.dart';
import 'seat_screen.dart'; // 좌석배치도 화면 이동을 위해 import 추가

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({super.key});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  int selectedDateIndex = 1;
  int selectedTimeIndex = 3;
  int? selectedTable;
  int selectedTabIndex = 0;

  // 실시간 날짜 생성
  List<Map<String, String>> get dates {
    final now = DateTime.now();
    final weekDays = ['월', '화', '수', '목', '금', '토', '일'];
    return List.generate(6, (i) {
      final date = now.add(Duration(days: i));
      String label = '';
      if (i == 0)
        label = '오늘';
      else if (i == 1)
        label = '내일';
      else if (i == 2)
        label = '모레';
      return {
        'label': label,
        'date': '${date.month}/${date.day}',
        'weekday': weekDays[date.weekday - 1],
      };
    });
  }

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
                          childAspectRatio: 2.2 / 1, // 적당히 얇게 조정
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
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
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
                                    const SizedBox(height: 2),
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
                                onTap: () {
                                  if (i == 0) {
                                    setState(() => selectedTabIndex = 0);
                                  } else {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (_) => SeatScreen(initialTab: i),
                                        settings: RouteSettings(
                                          arguments: {
                                            'selectedDate':
                                                dates[selectedDateIndex]['date'],
                                            'selectedTime':
                                                timeSlots[selectedTimeIndex]['time'],
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                },
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ), // SeatScreen과 동일하게
                ),
                onPressed: () {},
                child: Text(
                  '$selectedDate $selectedTime 예약하기',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
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

  // 메뉴탭만 내부에서 렌더링, 나머지 탭은 SeatScreen으로 이동
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SeatScreen(initialTab: 0),
                    ),
                  );
                },
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
}
