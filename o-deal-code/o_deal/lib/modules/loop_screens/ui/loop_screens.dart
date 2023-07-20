import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/modules/loop_screens/widgets/loop_content.dart';
import 'package:page_view_sliding_indicator/page_view_sliding_indicator.dart';
import 'package:dots_indicator/dots_indicator.dart';

class LoopScreen extends StatefulWidget {
  const LoopScreen({Key? key}) : super(key: key);

  @override
  _LoopScreenState createState() => _LoopScreenState();
}

class _LoopScreenState extends State<LoopScreen> {
  late int selectedPage;
  late final PageController? _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
              // alignment: AlignmentDirectional.left,
              children: [
              PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      selectedPage = page;
                    });
                  },
                  children: [
                    LoopContent(
                      text: "Deals",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem  Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the. ",
                      image: DecorationImage(
                        image: AssetImage("assets/images/loop-1.png"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.25), BlendMode.dstATop),
                      ),
                    ),
                    LoopContent(
                      text: "Saving",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem  Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the. ",
                      image: DecorationImage(
                        image: AssetImage("assets/images/loop-2.png"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.25), BlendMode.dstATop),
                      ),
                    ),
                    LoopContent(
                      text: "Shopping",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem  Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the. ",
                      image: DecorationImage(
                        image: AssetImage("assets/images/loop-3.png"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.25), BlendMode.dstATop),
                      ),
                    ),
                    LoopContent(
                      text: "Money",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem  Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the. ",
                      image: DecorationImage(
                        image: AssetImage("assets/images/loop-4.png"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.25), BlendMode.dstATop),
                      ),
                    ),
                    LoopContent(
                      text: "Hyperlocal",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem  Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the. ",
                      image: DecorationImage(
                        image: AssetImage("assets/images/loop-5.png"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.25), BlendMode.dstATop),
                      ),
                    ),
                  ]),
              Positioned(
                  bottom: 80,
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children:[
                      Container(
                      padding:EdgeInsets.symmetric(horizontal:20),
                      child: DotsIndicator(
                        dotsCount: 5,
                        position: selectedPage,
                        decorator: DotsDecorator(
                          colors: [
                            Color(0xFFFFFFFF).withOpacity(0.19),
                            Color(0xFFFFFFFF).withOpacity(0.19),
                            Color(0xFFFFFFFF).withOpacity(0.19),
                            Color(0xFFFFFFFF).withOpacity(0.19),
                            Color(0xFFFFFFFF).withOpacity(0.19),
                          ],
                          activeColors: [
                            Color(0xFFFFFFFF),
                            Color(0xFFFFFFFF),
                            Color(0xFFFFFFFF),
                            Color(0xFFFFFFFF),
                            Color(0xFFFFFFFF)
                          ],
                          size: const Size(18.0, 8.0),
                          activeSize: const Size(24.0, 8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    ]
                  )
                )
            ])));
  }
}
