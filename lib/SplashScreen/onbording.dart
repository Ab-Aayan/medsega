import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Group/Login/register.dart';
import '../components/content_model.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.042,
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Container(
                        height: 340,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              contents[i].image,
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              contents[i].title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              contents[i].discription,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 29, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0134, //12,
                  ),
                  Container(
                    height: height * 0.062, //48,
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    width: double.infinity,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 103, 192, 106)),
                        onPressed: () {
                          if (currentIndex == contents.length - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RegisterPage(),
                              ),
                            );
                          }
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 6),
                            curve: Curves.bounceIn,
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        )),
                  ),
                  SizedBox(height: height * 0.016 //14,
                      ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 103, 192, 106),
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.037,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.0088, //8,
      width: currentIndex == index ? 25 : 9.4,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? const Color.fromARGB(255, 103, 192, 106)
            : Colors.grey,
      ),
    );
  }
}
