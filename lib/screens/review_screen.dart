import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.black87,
        shadowColor: Colors.transparent,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '내가 쓴 리뷰',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Color(0xFFCFA857),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: const [
          _ReviewCard(
            place: '카페 리얼',
            date: '2025-05-18',
            rating: 4.5,
            content:
                '둔산동에서 가장 분위기 좋은 카페를 찾았습니다! 인테리어가 정말 감각적이고 창가 자리에서 보는 뷰가 너무 좋았어요. 아인슈페너와 티라미수를 주문했는데 둘 다 맛있었습니다. 특히 티라미수는 달지 않고 커피 향이 진해서 좋았어요. 다음에도 꼭 다시 방문할 예정입니다.',
            images: [
              'https://readdy.ai/api/search-image?query=aesthetic%2520coffee%2520shop%2520interior%2520with%2520minimalist%2520design%2C%2520warm%2520lighting%2C%2520wooden%2520tables%2C%2520plants%2C%2520cozy%2520atmosphere%2C%2520Seoul%2520cafe&width=120&height=120&seq=1&orientation=squarish',
              'https://readdy.ai/api/search-image?query=delicious%2520tiramisu%2520dessert%2520on%2520white%2520plate%2C%2520coffee%2520powder%2520dusting%2C%2520creamy%2520layers%2C%2520professional%2520food%2520photography%2C%2520cafe%2520setting&width=120&height=120&seq=2&orientation=squarish',
              'https://readdy.ai/api/search-image?query=specialty%2520coffee%2520drink%2520in%2520clear%2520glass%2C%2520topped%2520with%2520whipped%2520cream%2C%2520einspanner%2520coffee%2C%2520aesthetic%2520presentation%2C%2520cafe%2520setting&width=120&height=120&seq=3&orientation=squarish',
            ],
          ),
          _ReviewCard(
            place: '스시세이도',
            date: '2025-05-10',
            rating: 5.0,
            content:
                '오마카세 처음 도전해봤는데 정말 최고의 경험이었습니다. 셰프님의 설명을 들으며 먹는 스시는 또 다른 맛이네요. 특히 도로와 우니가 정말 신선하고 맛있었습니다. 가격은 있지만 그만한 가치가 있었어요. 특별한 날 방문하기 좋은 곳입니다.',
            images: [
              'https://readdy.ai/api/search-image?query=high-end%2520Japanese%2520sushi%2520omakase%2520restaurant%2520interior%2C%2520minimalist%2520design%2C%2520sushi%2520counter%2C%2520chef%2520preparing%2520food%2C%2520elegant%2520lighting&width=120&height=120&seq=4&orientation=squarish',
              'https://readdy.ai/api/search-image?query=premium%2520sushi%2520platter%2C%2520fresh%2520tuna%2C%2520salmon%2C%2520uni%2520sea%2520urchin%2C%2520professional%2520food%2520photography%2C%2520gourmet%2520presentation&width=120&height=120&seq=5&orientation=squarish',
            ],
          ),
          _ReviewCard(
            place: '맥주 브루어리',
            date: '2025-05-05',
            rating: 4.0,
            content:
                '친구들과 함께 방문했는데 분위기가 정말 좋았어요. 직접 양조한 맥주 중에서 IPA와 스타우트를 마셨는데 둘 다 맛있었습니다. 안주로 시킨 감자튀김과 치킨윙도 맥주와 잘 어울렸어요. 주말이라 사람이 많아서 약간 시끄러웠던 점이 아쉬웠지만, 맥주 맛은 정말 좋았습니다.',
            images: [
              'https://readdy.ai/api/search-image?query=craft%2520beer%2520brewery%2520bar%2520interior%2C%2520industrial%2520design%2C%2520beer%2520taps%2C%2520wooden%2520tables%2C%2520warm%2520lighting%2C%2520Seoul%2520nightlife&width=120&height=120&seq=6&orientation=squarish',
              'https://readdy.ai/api/search-image?query=craft%2520beer%2520flight%2520sampler%2C%2520different%2520beer%2520styles%2520in%2520small%2520glasses%2C%2520wooden%2520tray%2C%2520bar%2520setting&width=120&height=120&seq=7&orientation=squarish',
              'https://readdy.ai/api/search-image?query=pub%2520food%2520platter%2C%2520crispy%2520french%2520fries%2C%2520chicken%2520wings%2C%2520dipping%2520sauce%2C%2520professional%2520food%2520photography&width=120&height=120&seq=8&orientation=squarish',
            ],
          ),
          _ReviewCard(
            place: '양사싯골 대전',
            date: '2025-04-15',
            rating: 4.0,
            content:
                '방현동 골목에 숨어있는 작은 식당인데 정말 맛있었어요! 오래된 건물 지하에 있어서 찾기 어려웠지만, 찾아가는 재미도 있었습니다. 김치찌개와 된장찌개를 주문했는데 정말 깊은 맛이 일품이었어요. 반찬도 정성스럽게 준비되어 있었고, 가격도 합리적이었습니다.',
            images: [
              'https://readdy.ai/api/search-image?query=traditional%2520Korean%2520restaurant%2520interior%2C%2520humble%2520setting%2C%2520small%2520tables%2C%2520authentic%2520atmosphere%2C%2520Seoul%2520hidden%2520gem&width=120&height=120&seq=11&orientation=squarish',
              'https://readdy.ai/api/search-image?query=authentic%2520Korean%2520kimchi%2520jjigae%2520stew%2C%2520bubbling%2520hot%2520in%2520stone%2520pot%2C%2520tofu%2C%2520pork%2C%2520professional%2520food%2520photography&width=120&height=120&seq=12&orientation=squarish',
              'https://readdy.ai/api/search-image?query=Korean%2520banchan%2520side%2520dishes%2C%2520variety%2520of%2520small%2520plates%2C%2520kimchi%2C%2520pickled%2520vegetables%2C%2520traditional%2520presentation&width=120&height=120&seq=13&orientation=squarish',
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          } else if (index == 1) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/search',
              (route) => false,
            );
          } else if (index == 2) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/mypage',
              (route) => false,
            );
          }
        },
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String place;
  final String date;
  final double rating;
  final String content;
  final List<String> images;

  const _ReviewCard({
    required this.place,
    required this.date,
    required this.rating,
    required this.content,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                itemBuilder:
                    (context) => [
                      PopupMenuItem(value: 'edit', child: const Text('수정하기')),
                      PopupMenuItem(
                        value: 'delete',
                        child: const Text(
                          '삭제하기',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                onSelected: (value) {
                  if (value == 'edit') {
                    // TODO: 리뷰 수정 기능
                  } else if (value == 'delete') {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('리뷰 삭제'),
                            content: const Text(
                              '정말 이 리뷰를 삭제하시겠습니까? 삭제된 리뷰는 복구할 수 없습니다.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('취소'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // TODO: 삭제 처리
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  '삭제',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Row(
                children: List.generate(5, (i) {
                  if (rating >= i + 1) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    );
                  } else if (rating > i && rating < i + 1) {
                    return const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: 16,
                    );
                  } else {
                    return const Icon(
                      Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    );
                  }
                }),
              ),
              const SizedBox(width: 6),
              Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (context, i) => const SizedBox(width: 8),
              itemBuilder:
                  (context, i) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      images[i],
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
