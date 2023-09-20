import 'package:flutter/material.dart';
import 'package:mobile/componen/tournament/container_tournament_mendatang.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers
import '../../halaman/halaman_detail_tournament.dart';

class HalamanTournamenMendatang extends StatefulWidget {
  final int maxContainers;
  final bool isCarouselRunning;

  HalamanTournamenMendatang({
    required this.maxContainers,
    required this.isCarouselRunning,
  });

  @override
  _HalamanTournamenMendatangState createState() =>
      _HalamanTournamenMendatangState();
}

class _HalamanTournamenMendatangState extends State<HalamanTournamenMendatang> {
  final List<Map<String, String>> ads = [
    {
      'imagebg': 'assets/images/pubg_large.png',
      'imageUrl': 'assets/images/vocagame_hijau.png',
      'img1': 'assets/images/onic.png',
      'img2': 'assets/images/rrq.png',
      'img3': 'assets/images/evos.png',
      'game': 'Pubg Mobile',
      'status': 'Online',
      'tanggal': '11 jan 2023 - 13 jan 2023',
      'biaya': 'Rp. 130.000',
      'title1': '12 September 2023',
      'title2': 'Pubg Mobile Tournament',
      'title3': '1/100 Team Bergabung',
      'title4': 'Rp. 1.000.000',
    },
    {
      'imagebg': 'assets/images/freefire_large.png',
      'imageUrl': 'assets/images/vocagame_hijau.png',
      'img1': 'assets/images/onic.png',
      'img2': 'assets/images/rrq.png',
      'img3': 'assets/images/evos.png',
      'game': 'Free Fire',
      'status': 'Online',
      'tanggal': '10 jan 2023 - 14 jan 2023',
      'biaya': 'Rp. 120.000',
      'title1': '12 September 2023',
      'title2': 'FreeFire Tournament',
      'title3': '1/100 Team Bergabung',
      'title4': 'Rp. 1.100.000',
    },
    {
      'imagebg': 'assets/images/mobilelegend_large.png',
      'imageUrl': 'assets/images/vocagame_hijau.png',
      'img1': 'assets/images/onic.png',
      'img2': 'assets/images/rrq.png',
      'img3': 'assets/images/evos.png',
      'game': 'Mobile Legend',
      'status': 'Online',
      'tanggal': '20 jan 2023 - 24 jan 2023',
      'biaya': 'Rp. 100.000',
      'title1': '21 September 2023',
      'title2': 'Mobile Legend Tournament',
      'title3': '1/100 Team Bergabung',
      'title4': 'Rp. 1.000.000',
    },
    // Tambahkan data lainnya sesuai kebutuhan
  ];

  int _currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.isCarouselRunning) {
      _startAutoTransition();
    }
  }

  void _startAutoTransition() {
    if (widget.isCarouselRunning) {
      Future.delayed(Duration(seconds: 5), () {
        final nextPage = (_currentPageIndex + 1) % ads.length;
        _pageController.animateToPage(
          nextPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        _startAutoTransition();
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isCarouselRunning)
          Container(
            height: 240,
            child: PageView.builder(
              controller: _pageController,
              itemCount: ads.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final ad = ads[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TournamentDetailPage(
                          tournamentData: ad,
                        ),
                      ),
                    );
                  },
                  child: TournamenMendatang(
                    imageUrl: ad['imageUrl']!,
                    imagebg: ad['imagebg']!,
                    img1: ad['img1']!,
                    img2: ad['img2']!,
                    img3: ad['img3']!,
                    game: ad['game']!,
                    status: ad['status']!,
                    biaya: ad['biaya']!,
                    tanggal: ad['tanggal']!,
                    title1: ad['title1']!,
                    title2: ad['title2']!,
                    title3: ad['title3']!,
                    title4: ad['title4']!,
                  ),
                );
              },
            ),
          )
        else
          Column(
            children: ads.map((ad) {
              return TournamenMendatang(
                imageUrl: ad['imageUrl']!,
                imagebg: ad['imagebg']!,
                img1: ad['img1']!,
                img2: ad['img2']!,
                img3: ad['img3']!,
                game: ad['game']!,
                status: ad['status']!,
                biaya: ad['biaya']!,
                tanggal: ad['tanggal']!,
                title1: ad['title1']!,
                title2: ad['title2']!,
                title3: ad['title3']!,
                title4: ad['title4']!,
              );
            }).toList(),
          ),
        if (widget.isCarouselRunning)
          AutomaticCarouselIndicator(
            count: ads.length,
            activeIndex: _currentPageIndex,
            animationDuration: Duration(milliseconds: 500),
          ),
      ],
    );
  }
}

class AutomaticCarouselIndicator extends StatefulWidget {
  final int count;
  final int activeIndex;
  final Duration animationDuration;

  AutomaticCarouselIndicator({
    required this.count,
    required this.activeIndex,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  _AutomaticCarouselIndicatorState createState() =>
      _AutomaticCarouselIndicatorState();
}

class _AutomaticCarouselIndicatorState
    extends State<AutomaticCarouselIndicator> {
  late int _currentIndex;
  late int _previousIndex;
  late bool _transitioning;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.activeIndex;
    _previousIndex = _currentIndex;
    _transitioning = false;
  }

  @override
  void didUpdateWidget(AutomaticCarouselIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.activeIndex != _currentIndex) {
      _transitioning = true;
      _previousIndex = _currentIndex;
      _currentIndex = widget.activeIndex;

      Future.delayed(widget.animationDuration, () {
        if (mounted) {
          setState(() {
            _transitioning = false;
          });
        }
      });
    }
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      width: isActive ? 16.0 : 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.count, (index) {
          bool isActive = index == _currentIndex;
          bool wasActive = index == _previousIndex;

          if (_transitioning) {
            return _buildIndicator(isActive || wasActive);
          } else {
            return _buildIndicator(isActive);
          }
        }),
      ),
    );
  }
}
