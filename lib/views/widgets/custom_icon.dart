import 'package:flutter/material.dart';
import 'package:reels_video_application/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: 38,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(7)),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 38,
          decoration: BoxDecoration(
              color: Colors.cyan, borderRadius: BorderRadius.circular(7)),
        ),
        Center(
          child: Container(
            child:Icon(Icons.add, color: Colors.black,size: 20,),
            height: double.infinity,
            width: 38,
            decoration: BoxDecoration(
                color:Colors.white, borderRadius: BorderRadius.circular(7)),
          ),
        ),
        
      ]),
    );
  }
}
