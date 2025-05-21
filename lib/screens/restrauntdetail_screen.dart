import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({super.key});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen>
    with TickerProviderStateMixin {
  int selectedDateIndex = 1;
  int selectedTimeIndex = 3;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFCFA857);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('라 피아짜'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [IconButton(icon: const Icon(Icons.share), onPressed: () {})],
      ),
      body: Column(
        children: [
          // 이미지 상단
          SizedBox(
            height: 200,
            child: Image.network(
              'https://readdy.ai/api/search-image?query=modern%20italian%20restaurant&width=600&height=400',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // 기본 정보
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '라 피아짜',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text('4.7 (156)', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 12),
                    Icon(Icons.location_on_outlined, size: 16),
                    Text('대전 중구 은행동 123-45', style: TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: const [
                    Chip(label: Text('이탈리안')),
                    Chip(label: Text('파스타')),
                    Chip(label: Text('피자')),
                  ],
                ),
              ],
            ),
          ),

          // 날짜 선택
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                final day = ['일', '월', '화', '수', '목', '금', '토'][index % 7];
                final date = 16 + index;
                final isSelected = index == selectedDateIndex;

                return GestureDetector(
                  onTap: () => setState(() => selectedDateIndex = index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primaryColor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$day',
                          style: TextStyle(
                            color: isSelected ? Colors.white : primaryColor,
                          ),
                        ),
                        Text(
                          '$date',
                          style: TextStyle(
                            color: isSelected ? Colors.white : primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // 시간 선택
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                final isSelected = index == selectedTimeIndex;
                return GestureDetector(
                  onTap: () => setState(() => selectedTimeIndex = index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor : Colors.white,
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${12 + index}:00',
                      style: TextStyle(
                        color: isSelected ? Colors.white : primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // 탭바
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: primaryColor,
              tabs: const [
                Tab(text: '메뉴'),
                Tab(text: '좌석배치도'),
                Tab(text: '정보'),
                Tab(text: '리뷰'),
              ],
            ),
          ),

          // 탭 콘텐츠
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(child: Text('메뉴 내용')), // 메뉴 탭
                Center(child: Text('좌석 배치도')), // 좌석 탭
                Center(child: Text('가게 정보')), // 정보 탭
                Center(child: Text('리뷰 목록')), // 리뷰 탭
              ],
            ),
          ),
        ],
      ),

      // 예약 버튼
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Text('예약 완료'),
                    content: Text(
                      '5월 ${16 + selectedDateIndex}일 ${12 + selectedTimeIndex}:00\n2인 테이블\n라 피아짜',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('확인'),
                      ),
                    ],
                  ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            '5월 ${16 + selectedDateIndex}일 ${12 + selectedTimeIndex}:00 예약하기',
          ),
        ),
      ),
    );
  }
}
