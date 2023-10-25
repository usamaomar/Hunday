// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';

class CustomUrlsSlider extends StatefulWidget {
  const CustomUrlsSlider({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomUrlsSliderState createState() => _CustomUrlsSliderState();
}

class _CustomUrlsSliderState extends State<CustomUrlsSlider> {
  List<String>? imageSlidersList;
  List<String>? imageSlidersText;
  @override
  void initState() {
    imageSlidersList = [
      'https://carwow-uk-wp-3.imgix.net/18015-MC20BluInfinito-scaled-e1666008987698.jpg',
      'https://www.supercars.net/blog/wp-content/uploads/2022/08/Supercars-with-Incredible-Six-Cylinder-Engines-Header-Image-MC20.jpg',
      'https://www.autocar.co.uk/sites/autocar.co.uk/files/images/car-reviews/first-drives/legacy/1-maserati-mc20-2022-uk-first-drive-review-lead.jpg',
      'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/1-ferrari-296-gtb-top-10.jpg'
    ];
    imageSlidersText = [
      'Car 1',
      'Car 2',
      'Car 3',
      'Car 4',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 0.5,
          enlargeCenterPage: true,
        ),
        items: imageSliders(),
      ),
    );
  }

  List<Widget> imageSliders() {
    return (imageSlidersList ?? []).map((item) {
      return LayoutBuilder(builder: (context, box) {
        return Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: box.maxWidth * 5.4,
                        height: box.maxHeight * 0.65,
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      imageSlidersText?[0] ?? '',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      });
    }).toList();
  }
}
