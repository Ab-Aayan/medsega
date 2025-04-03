import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/categories/cat_eye.png",
        "text": "Optometrist",
      },
      {
        "icon": "assets/categories/cat_eye.png",
        "text": "Dentist",
      },
      {
        "icon": "assets/categories/cat_eye.png",
        "text": "Cardiologist",
      },
      {
        "icon": "assets/categories/cat_eye.png",
        "text": "Surgeon",
      },
      {
        "icon": "assets/categories/cat_eye.png",
        "text": "Radiologist",
      },
      {
        "icon": "assets/categories/cat_eye.png",
        "text": "Gynecologist",
      },
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length,
            (index) => CategoriesCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {
                print('object');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesCard extends StatefulWidget {
  const CategoriesCard(
      {super.key, required this.icon, required this.text, required this.press});
  final String icon, text;
  final GestureTapCallback press;

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: SizedBox(
        width: 78,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(widget.icon),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.heebo(
                color: const Color.fromARGB(129, 0, 0, 0),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
