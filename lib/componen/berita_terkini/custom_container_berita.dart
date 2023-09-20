// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_final_fields, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mobile/componen/beranda/container_berita.dart';

class CustomContainerBerita extends StatefulWidget {
  final int maxContainers;
  final bool isCarouselRunning;

  CustomContainerBerita(
      {required this.maxContainers, required this.isCarouselRunning});

  @override
  _CustomContainerBeritaState createState() => _CustomContainerBeritaState();
}

class _CustomContainerBeritaState extends State<CustomContainerBerita> {
  final List<Map<String, String>> ads = [
    {
      'imageUrl': 'assets/images/berita.png',
      'title1':
          'Grand Final Persebaya Game Fest 2022 : Turnamen E-Sport Pertama Persebaya Oleh Vocagame',
      'title2':
          'Minggu 18 Desember 2022 - menjadi hari puncakpenentuan pemenang dari perhelatan akbarPersebaya Game Fest 2022 yang merupakankolaborasi dari VocaGame dengan klub Persebaya Surabaya. Event kolaborasiini diadakan di panggung Hedon Estate,  Surabaya yang dihadiri oleh Bapak Prof. Dr. Dahlan Iskan, Kepala Dinas Pemuda dan Olahraga Jawa Timur Bapak Pulung Chausar, Bapak Brigjen TNI Fahmi Sudirman selaku Ketua Esport Indonesia Jawa Timur, Bapak Yahya Alkatiri selaku manager dari klub sepakbola Persebaya Surabaya dan kehadiran dari banyak pihak yang mendukung terselenggaranya Persebaya Game Fest 2022.',
    },
    {
      'imageUrl': 'assets/images/berita2.png',
      'title1':
          'Kolaborasi Metaverse PUBG Mobile X BLACKPINK Berhasil Meraih Penghargaan Best Metaverse Performance di MTV Europe Music ',
      'title2':
          'Ajang penghargaan musikus yang dipandu langsung oleh Rita Ora dan Taika Waititi ini disiarkan langsung dari Düsseldorf, Germany. Acara yang berlangsung pada 13 November 2022 itu telah mengumumkan daftar pemenang dari',
    },
    {
      'imageUrl': 'assets/images/berita3.png',
      'title1':
          'Mengatasi Mata Cepat Lelah akibat Terlalu Lama Bermain Mobile Games',
      'title2':
          'Kesehatan fisik menjadi salah satu faktor penting bagi para gamers dapat bertarung memenangkan permainan, terutama kesehatan mata. Kemampuan mata untuk tetap fokus pada permainan selama durasi',
    },
    {
      'imageUrl': 'assets/images/berita2.png',
      'title1':
          'Kolaborasi Metaverse PUBG Mobile X BLACKPINK Berhasil Meraih Penghargaan Best Metaverse Performance di MTV Europe Music ',
      'title2':
          'Ajang penghargaan musikus yang dipandu langsung oleh Rita Ora dan Taika Waititi ini disiarkan langsung dari Düsseldorf, Germany. Acara yang berlangsung pada 13 November 2022 itu telah mengumumkan daftar pemenang dari',
    },
  ];

  int _currentPageIndex = 0;
  late PageController _pageController;
  bool _isCarouselRunning = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.isCarouselRunning) {
      _startAutoTransition();
    }
  }

  void _startAutoTransition() {
    if (_isCarouselRunning) {
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

  List<String> splitIntoSentences(String text) {
    return text.split(RegExp(r'(?<=[.!?])\s+'));
  }

  String truncateText(String text, int minSentences) {
    List<String> sentences = splitIntoSentences(text);
    if (sentences.length <= minSentences) {
      return text;
    } else {
      List<String> truncatedSentences = sentences.sublist(0, minSentences);
      return truncatedSentences.join(' ') + " ...";
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
            height: 280,
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
                return Berita(
                  imageUrl: ad['imageUrl']!,
                  title1: truncateText(ad['title1']!, 12),
                  title2: truncateText(ad['title2']!, 12),
                );
              },
            ),
          )
        else
          Column(
            children: ads.map((ad) {
              return Berita(
                imageUrl: ad['imageUrl']!,
                title1: ad['title1']!,
                title2: ad['title2']!,
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
