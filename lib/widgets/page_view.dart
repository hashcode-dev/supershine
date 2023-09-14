import 'dart:async';
import 'package:flutter/material.dart';
import '../integration/image_resource_integration.dart';
import 'image_container.dart';

class HomeScreenPageView extends StatefulWidget{
  const HomeScreenPageView({super.key});

  @override
  State<HomeScreenPageView> createState() => _HomeScreenPageView();
}

class _HomeScreenPageView extends State<HomeScreenPageView> {
  PageController controller = PageController();
  int _currentIndex = 0;
  late List<ImageContainer> imageContainerList = <ImageContainer>[];

  @override
  void initState() {
    ImageResourceIntegration().getImageContainerList().then((value) => setState(() {
      imageContainerList = value;
    }));
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      print("Inside initState(): $_currentIndex");
      if(imageContainerList != null && imageContainerList.isNotEmpty){
        if(_currentIndex < imageContainerList.length){
          controller.animateToPage(
            _currentIndex,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
          _currentIndex++;
        }else{
          _currentIndex = 0;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Inside build()");
    return Container(
    height: 250,
    margin: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        // color: Colors.lightBlueAccent,
    ),
      child: PageView(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: controller,
        children: imageContainerList,
        onPageChanged: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}