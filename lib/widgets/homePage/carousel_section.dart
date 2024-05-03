import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSection extends StatefulWidget {
  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.20,
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, _) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [
            "assets/images/carousel.png",
            "assets/images/carousel.png",
            "assets/images/carousel.png",
            // tambahkan semua gambar yang diperlukan di sini
          ].map((String imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0), // Tambahkan border radius di sini
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0), // ClipRRect untuk memotong gambar sesuai dengan border radius
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: 300.0, // ubah lebar sesuai kebutuhan
                      height: 200.0, // ubah tinggi sesuai kebutuhan
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        // Indikator Carousel
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [0, 1, 2].map((index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.05,
              height: MediaQuery.of(context).size.height * 0.01,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: _currentIndex == index ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12.0),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
