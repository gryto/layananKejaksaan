import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kejaksaan/src/constant.dart';

class SmartDeviceBoxWidget extends StatelessWidget {
  final String smartDeviceName;
  final Color smartDeviceColor;
  final String imageProvider;
  // final IconData icon;
  final double? width;
  final double? heightImage;

  const SmartDeviceBoxWidget({
    Key? key,
    required this.smartDeviceName,
    required this.smartDeviceColor,
    required this.imageProvider,
    // required this.icon,
    required this.width,
    this.heightImage,
  }) : super(key: key);

  @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.all(1.0),
  //     child: AnimatedContainer(
  //       duration: Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //       decoration: BoxDecoration(
  //         color: smartDeviceColor,
  //         image: DecorationImage(image: NetworkImage(imageProvider)),
  //         borderRadius: BorderRadius.circular(8),
  //         boxShadow: const [
  //           BoxShadow(
  //             color: clrBackground,
  //             blurRadius: 1.0,
  //             spreadRadius: 0.5,
  //             offset: Offset(1, 1),
  //           ),
  //         ],
  //       ),
  //       padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
  //       child: Container(
  //         padding: const EdgeInsets.all(2),
  //         child: Padding(
  //           padding: const EdgeInsets.all(0),
  //           child: Center(
  //             child: Column(
  //               children: [
  //                 // Icon(
  //                 //   icon,
  //                 //   size: 60,
  //                 //   color: Colors.white,
  //                 // ),
  //                 const SizedBox(
  //                   height: 85,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     Expanded(
  //                       child: Text(smartDeviceName,
  //                           maxLines: 3,
  //                           style: const TextStyle(
  //                               overflow: TextOverflow.ellipsis,
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w800,
  //                               color: Colors.white),
  //                           textAlign: TextAlign.left),
  //                     ),
  //                     const Icon(
  //                       Icons.arrow_circle_right,
  //                       color: Colors.white,
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  ////////////////
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.all(1.0),
  //     child: AnimatedContainer(
  //       duration: Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //       decoration: BoxDecoration(
  //         color: Colors.transparent, // Set the base color to transparent
  //         borderRadius: BorderRadius.circular(8),
  //         boxShadow: const [
  //           BoxShadow(
  //             color: clrBackground,
  //             blurRadius: 1.0,
  //             spreadRadius: 0.5,
  //             offset: Offset(1, 1),
  //           ),
  //         ],
  //       ),
  //       padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
  //       child: Stack(
  //         children: [
  //           // Background image
  //           Container(
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: NetworkImage(imageProvider),
  //                 fit: BoxFit.cover,
  //               ),
  //               borderRadius: BorderRadius.circular(8),
  //             ),
  //           ),
  //           // Color overlay with opacity
  //           Container(
  //             decoration: BoxDecoration(
  //               color: smartDeviceColor
  //                   .withOpacity(0.6), // Adjust opacity as needed
  //               borderRadius: BorderRadius.circular(8),
  //             ),
  //           ),
  //           // Content
  //           Container(
  //             padding: const EdgeInsets.all(2),
  //             child: Padding(
  //               padding: const EdgeInsets.all(0),
  //               child: Center(
  //                 child: Column(
  //                   children: [
  //                     const SizedBox(
  //                       height: 85,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         Expanded(
  //                           child: Text(smartDeviceName,
  //                               maxLines: 3,
  //                               style: const TextStyle(
  //                                   overflow: TextOverflow.ellipsis,
  //                                   fontSize: 14,
  //                                   fontWeight: FontWeight.w800,
  //                                   color: Colors.white),
  //                               textAlign: TextAlign.left),
  //                         ),
  //                         const Icon(
  //                           Icons.arrow_circle_right,
  //                           color: Colors.white,
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageProvider),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Color overlay with opacity
          Container(
            decoration: BoxDecoration(
              gradient:LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.05),
                    const Color.fromARGB(255, 13, 46, 28),
                  ],
                ), // Use the gradient directly
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Content
          Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 85,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(smartDeviceName,
                            maxLines: 3,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                            textAlign: TextAlign.left),
                      ),
                      const Icon(
                        Icons.arrow_circle_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    
    // AnimatedContainer(
    //   duration: Duration(milliseconds: 500),
    //   curve: Curves.easeInOut,
    //   decoration: BoxDecoration(
    //     color: Colors.transparent, // Set the base color to transparent
    //     borderRadius: BorderRadius.circular(8),
    //     boxShadow: [
    //       BoxShadow(
    //         color: clrBackground,
    //         blurRadius: 1.0,
    //         spreadRadius: 0.5,
    //         offset: Offset(1, 1),
    //       ),
    //     ],
    //   ),
    //   padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    //   child: Stack(
    //     children: [
    //       // Background image
    //       Container(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: NetworkImage(imageProvider),
    //             fit: BoxFit.cover,
    //           ),
    //           borderRadius: BorderRadius.circular(8),
    //         ),
    //       ),
    //       // Color overlay with opacity
    //       Container(
    //         decoration: BoxDecoration(
    //           gradient:LinearGradient(
    //               begin: Alignment.topCenter,
    //               end: Alignment.bottomCenter,
    //               colors: [
    //                 clrBackgroundLight.withOpacity(0.16),
    //                 const Color.fromARGB(255, 13, 30, 46),
    //               ],
    //             ), // Use the gradient directly
    //           borderRadius: BorderRadius.circular(8),
    //         ),
    //       ),
    //       // Content
    //       Container(
    //         padding: const EdgeInsets.all(2),
    //         child: Center(
    //           child: Column(
    //             children: [
    //               const SizedBox(
    //                 height: 85,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [
    //                   Expanded(
    //                     child: Text(smartDeviceName,
    //                         maxLines: 3,
    //                         style: const TextStyle(
    //                             overflow: TextOverflow.ellipsis,
    //                             fontSize: 14,
    //                             fontWeight: FontWeight.w800,
    //                             color: Colors.white),
    //                         textAlign: TextAlign.left),
    //                   ),
    //                   const Icon(
    //                     Icons.arrow_circle_right,
    //                     color: Colors.white,
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
  );
}

}
