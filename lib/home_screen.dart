import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'course_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openCourse(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const CourseScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ColoredBox(
                color: const Color(0xFF3D5CFF),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, top + 17, 20, 62),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, Kristin',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                            Text(
                              'Let’s start learning',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/avatar.svg',
                        width: 36,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -46),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _TodayCard(onCourses: () => _openCourse(context)),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 154,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 20),
                        children: [
                          _LearnCard(onStart: () => _openCourse(context)),
                          const SizedBox(width: 12),
                          const _SecondCard(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Learning Plan',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF1F1F39),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _PlanCard(),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _MeetupCard(),
                    ),
                    const SizedBox(height: 24),
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

class _TodayCard extends StatelessWidget {
  const _TodayCard({required this.onCourses});

  final VoidCallback onCourses;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Learned today',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF858597),
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onCourses,
                child: Text(
                  'My courses',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF3D5CFF),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '46min',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1F1F39),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: '  / 60min',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF858597),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: SizedBox(
              height: 6,
              width: double.infinity,
              child: Stack(
                children: [
                  const ColoredBox(
                    color: Color(0xFFF4F3FD),
                    child: SizedBox.expand(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 210,
                      height: 6,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x00FFFFFF), Color(0xFFFF5106)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LearnCard extends StatelessWidget {
  const _LearnCard({required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 249,
        height: 154,
        child: Stack(
          children: [
            const ColoredBox(
              color: Color(0xFFCEECFE),
              child: SizedBox.expand(),
            ),
            Positioned(
              left: 18,
              top: 20,
              right: 0,
              child: Text(
                'What do youwant to learn today ?',
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.clip,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1F1F39),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/images/learner.svg',
                width: 119,
                height: 134,
              ),
            ),
            Positioned(
              left: 18,
              top: 104,
              child: GestureDetector(
                onTap: onStart,
                child: Container(
                  width: 85,
                  height: 31,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6905),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondCard extends StatelessWidget {
  const _SecondCard();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 249,
        height: 154,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/second_card.svg',
              width: 249,
              height: 154,
            ),
            Positioned(
              left: 18.7,
              top: 25.8,
              child: SvgPicture.asset(
                'assets/images/second_illu.svg',
                width: 162.787,
                height: 117.491,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        children: [
          _PlanRow(
            icon: 'assets/images/progress_a.svg',
            title: 'Packaging Design',
            done: '40',
            total: '/48',
          ),
          SizedBox(height: 17),
          _PlanRow(
            icon: 'assets/images/progress_b.svg',
            title: 'Product Design',
            done: '6',
            total: '/24',
          ),
        ],
      ),
    );
  }
}

class _PlanRow extends StatelessWidget {
  const _PlanRow({
    required this.icon,
    required this.title,
    required this.done,
    required this.total,
  });

  final String icon;
  final String title;
  final String done;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        const SizedBox(width: 13),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: const Color(0xFF1F1F39),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: done,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1F1F39),
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: total,
                style: GoogleFonts.poppins(
                  color: const Color(0xFFB8B8D2),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MeetupCard extends StatelessWidget {
  const _MeetupCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFEFE0FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 21,
            top: 27,
            child: Text(
              'Meetup',
              style: GoogleFonts.poppins(
                color: const Color(0xFF440687),
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ),
          Positioned(
            left: 22.7,
            top: 55.1,
            width: 251,
            child: Text(
              'Off-line exchange of learning experiences',
              maxLines: 1,
              overflow: TextOverflow.clip,
              softWrap: false,
              style: GoogleFonts.poppins(
                color: const Color(0xFF440687),
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
            left: 248.65,
            top: 20,
            child: SvgPicture.asset(
              'assets/images/meetup_a.svg',
              width: 51.114,
              height: 51.115,
            ),
          ),
          Positioned(
            left: 234.45,
            top: 47.24,
            child: SvgPicture.asset(
              'assets/images/meetup_b.svg',
              width: 35.313,
              height: 42.088,
            ),
          ),
          Positioned(
            left: 278.67,
            top: 45.54,
            child: Image.asset(
              'assets/images/meetup_c.png',
              width: 33.336,
              height: 43.863,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
