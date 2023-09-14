
import 'package:flutter/cupertino.dart';

class ImageContainer extends StatefulWidget{
  const ImageContainer({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  State<ImageContainer> createState() => _ImageContainer();
}

class _ImageContainer extends State<ImageContainer>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(widget.imageUrl),
          fit: BoxFit.fill
      ),
          borderRadius: BorderRadius.circular(8.0),
    )
    );
  }
}