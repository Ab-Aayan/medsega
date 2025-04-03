import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderP extends StatefulWidget {
  const SliderP({Key? key}) : super(key: key);

  @override
  State<SliderP> createState() => _SliderPState();
}

class _SliderPState extends State<SliderP> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/DoctorImg/sdk.png',
    'assets/DoctorImg/doctor_1.png',
    'assets/DoctorImg/femal_1.png',
    'assets/DoctorImg/Info_doctor.png',
    'assets/DoctorImg/men_1.png',
    'assets/DoctorImg/men_2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return buildImage(urlImage, index);
          },
          options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: false,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
            height: 120,
          ),
        ),
        const SizedBox(height: 12),
        buildIndicator()
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 8, dotHeight: 8, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) => Opacity(
      opacity: 0.67,
      child: Container(
        height: 200,
        width: 368,
        decoration: ShapeDecoration(
          color: const Color(0xFF2BA1A1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 5,
              offset: Offset(0, 8),
              spreadRadius: 2,
            )
          ],
        ),
        child: Image.asset(
          urlImage,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
