import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int _tab = 0;

  static const _lessons = [
    ('Introduction to React', '04:28 min', true),
    ('Understanding React', '06:12 min', false),
    ('Create first React project', '43:58 min', false),
    ('Build React', '26:18 min', false),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final top = MediaQuery.paddingOf(context).top;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final scale = size.width / 393;
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFF),
      body: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 393,
          height: size.height / scale,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: 805 + top,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 11,
                        top: 3 + top,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/images/back.svg',
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 42,
                        top: 12 + top,
                        child: Text(
                          'Course Overview',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF2C2C2C),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 87 + top,
                        width: 335,
                        height: 207,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/course_hero.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 176,
                        top: 164 + top,
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 16,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: Color(0xFFFF7401),
                            size: 32,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 328 + top,
                        child: Text(
                          'React Front To back',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF2C2C2C),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 364 + top,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 14,
                              color: Color(0xFF8C8C8C),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '6h 30min',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF8C8C8C),
                                fontSize: 14,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                '·',
                                style: TextStyle(
                                  color: Color(0xFF8C8C8C),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              '7 lessons',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF8C8C8C),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 317,
                        top: 361 + top,
                        child: Container(
                          width: 54,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF4FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '4.9',
                                style: GoogleFonts.roboto(
                                  color: const Color(0xFFFF7401),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 407 + top,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _Tab(
                              text: 'Lessons',
                              selected: _tab == 0,
                              onTap: () => setState(() => _tab = 0),
                            ),
                            const SizedBox(width: 36),
                            _Tab(
                              text: 'Description',
                              selected: _tab == 1,
                              onTap: () => setState(() => _tab = 1),
                            ),
                          ],
                        ),
                      ),
                      if (_tab == 0)
                        for (var i = 0; i < _lessons.length; i++)
                          Positioned(
                            left: 36,
                            right: 32,
                            top: (const [460.0, 529.0, 599.0, 669.0])[i] + top,
                            child: _LessonRow(
                              title: _lessons[i].$1,
                              duration: _lessons[i].$2,
                              filled: _lessons[i].$3,
                            ),
                          ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 120,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFF9FBFF).withValues(alpha: 0),
                          const Color(0xCFF9FBFF),
                          const Color(0xFFF9FBFF),
                        ],
                        stops: const [0, 0.05, 0.575],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 36,
                right: 22,
                bottom: bottom + 13,
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFF2F2F2)),
                      ),
                      child: Text(
                        'Free',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFFFF7401),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF7401),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          'Enroll Now',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? const Color(0xFFFF7401)
        : const Color(0xFFD2D2D2);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: GoogleFonts.roboto(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 100,
            height: 2,
            color: selected ? const Color(0xFFFF7401) : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class _LessonRow extends StatelessWidget {
  const _LessonRow({
    required this.title,
    required this.duration,
    required this.filled,
  });

  final String title;
  final String duration;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: filled ? const Color(0xFFFF7401) : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: filled
                    ? const Color(0x33FF7401)
                    : const Color(0x1A000000),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(
            Icons.play_arrow_rounded,
            color: filled ? Colors.white : const Color(0xFFFF7401),
            size: 22,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  color: const Color(0xFF2C2C2C),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                duration,
                style: GoogleFonts.roboto(
                  color: const Color(0xFFAEAEAE),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Color(0xFFFF7401), size: 22),
      ],
    );
  }
}
