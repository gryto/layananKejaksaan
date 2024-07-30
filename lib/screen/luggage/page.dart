import 'dart:convert';

import 'package:flutter/material.dart';
import '../../src/api.dart';
import '../../src/constant.dart';
import '../../src/loader.dart';
import '../../src/preference.dart';
import '../../src/toast.dart';
import '../../src/utils.dart';
import 'package:http/http.dart' as http;

import 'component/list.dart';

class LuggagePage extends StatefulWidget {
  final id;
  const LuggagePage({super.key, required this.id});

  @override
  State<LuggagePage> createState() => _LuggagePageState();
}

class _LuggagePageState extends State<LuggagePage> {
  SharedPref sharedPref = SharedPref();
  bool isProcess = false;
  int pageIndex = 0;
  String fullName = "";
  String division = "";
  String typeUser = "";
  String path = "";
  String accessToken = "";
  String dateString = "";
  late final Function(int) callback;
  String message = "";
  List<Map<String, dynamic>> listData = [];
  List listDataLayanan = [];
  List listDataHistoryMonth = [];
  List listDataHistoryWeek = [];
  List listDataHistoryDay = [];
  String messagess = "";
  List<Widget> pages = <Widget>[]; // Declare pages here

  String fullname = "";
  late int userId = 0;

  var offset = 0;
  var limit = 10;

  @override
  void initState() {
    getDataLayanan(widget.id);
    super.initState();
  }

  getDataLayanan(id) async {
    try {
      var accessToken = await sharedPref.getPref("access_token");
      print("accestoke");
      print(accessToken);
      var url = ApiService.getLayananDetail;
      var uri = "$url/$id";
      var bearerToken = 'Bearer $accessToken';
      var response = await http.get(Uri.parse(uri),
          headers: {"Authorization": bearerToken.toString()});
      print("url");
      print(uri);
      print(response);

      if (response.statusCode == 200) {
        setState(() {
          var content = json.decode(response.body);
          listDataLayanan = content['data'];

          print("detaillayanan");

          print(listDataLayanan);
        });
      } else {
        toastShort(context, message);
      }
    } catch (e) {
      toastShort(context, e.toString());
    }

    setState(() {
      isProcess = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height - 20;
    double w = MediaQuery.of(context).size.width - 0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: clrPrimary,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            'Layanan Antar Barang',
            style: SafeGoogleFont(
              'SF Pro Text',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.2575,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: isProcess
              ? LayananList(data: listDataLayanan)
              : loaderDialog(context),

          // Column(
          //   children: [
          //     Stack(
          //       children: [
          //         Container(
          //           height: 105,
          //           decoration: const BoxDecoration(
          //             color: Colors.white,
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(
          //             left: 15,
          //             right: 15,
          //           ),
          //           child: Column(
          //             children: [
          //               const SizedBox(
          //                 height: 3,
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(
          //                     top: 10, left: 0, right: 0, bottom: 10),
          //                 child:

          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     GestureDetector(
          //                       onTap: () {
          //                         // Navigator.of(context).push(
          //                         //   MaterialPageRoute(
          //                         //     builder: (context) =>
          //                         //         const LuggagePage(),
          //                         //   ),
          //                         // );
          //                       },
          //                       child: Container(
          //                         padding: const EdgeInsets.only(
          //                             top: 5, left: 0, right: 0, bottom: 5),
          //                         decoration: const BoxDecoration(
          //                           borderRadius: BorderRadius.all(
          //                             Radius.circular(10),
          //                           ),
          //                         ),
          //                         child: Container(
          //                           padding: const EdgeInsets.all(70),
          //                           decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(10),
          //                               color: clrPrimary),
          //                           child: const Center(
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 Text(
          //                                   "Layanan Antar Barang",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w800,
          //                                     fontSize: 18,
          //                                     color: Colors.white
          //                                   ),
          //                                 ),
          //                                 Text(
          //                                   "Laporan Informasi Harian",
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w700,
          //                                       fontSize: 16,
          //                                       color: Colors.white),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     GestureDetector(
          //                       onTap: () {
          //                         // Navigator.of(context).push(
          //                         //   MaterialPageRoute(
          //                         //     builder: (context) =>
          //                         //         const LapinsusPage(),
          //                         //   ),
          //                         // );
          //                       },
          //                       child: Container(
          //                         padding: const EdgeInsets.only(
          //                             top: 5, left: 0, right: 0, bottom: 5),
          //                         decoration: const BoxDecoration(
          //                           borderRadius: BorderRadius.all(
          //                             Radius.circular(10),
          //                           ),
          //                         ),
          //                         child: Container(
          //                           padding: const EdgeInsets.all(70),
          //                           decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(10),
          //                               color: clrPrimary),
          //                           child: const Center(
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 Text(
          //                                   "Layanan Antar Tilang",
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w800,
          //                                       fontSize: 18,
          //                                       color: Colors.white),
          //                                 ),
          //                                 Text(
          //                                   "Laporan Informasi Khusus",
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w700,
          //                                       fontSize: 16,
          //                                       color: Colors.white),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     GestureDetector(
          //                       onTap: () {
          //                         // Navigator.of(context).push(
          //                         //   MaterialPageRoute(
          //                         //     builder: (context) =>
          //                         //         const LapinharPage(),
          //                         //   ),
          //                         // );
          //                       },
          //                       child: Container(
          //                         padding: const EdgeInsets.only(
          //                             top: 5, left: 0, right: 0, bottom: 5),
          //                         decoration: const BoxDecoration(
          //                           borderRadius: BorderRadius.all(
          //                             Radius.circular(10),
          //                           ),
          //                         ),
          //                         child: Container(
          //                           padding: const EdgeInsets.all(70),
          //                           decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(10),
          //                               color: clrPrimary),
          //                           child: const Center(
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 Text(
          //                                   "Layanan Antar Jemput",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w800,
          //                                     fontSize: 18,
          //                                     color: Colors.white
          //                                   ),
          //                                 ),
          //                                 Text(
          //                                   "Laporan Informasi Harian",
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w700,
          //                                       fontSize: 16,
          //                                       color: Colors.white),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),

          //                     GestureDetector(
          //                       onTap: () {
          //                         // Navigator.of(context).push(
          //                         //   MaterialPageRoute(
          //                         //     builder: (context) =>
          //                         //         const LapinharPage(),
          //                         //   ),
          //                         // );
          //                       },
          //                       child: Container(
          //                         padding: const EdgeInsets.only(
          //                             top: 5, left: 0, right: 0, bottom: 5),
          //                         decoration: const BoxDecoration(
          //                           borderRadius: BorderRadius.all(
          //                             Radius.circular(10),
          //                           ),
          //                         ),
          //                         child: Container(
          //                           padding: const EdgeInsets.all(70),
          //                           decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(10),
          //                               color: clrPrimary),
          //                           child: const Center(
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 Text(
          //                                   "Layanan Pengaduan Masyarakat",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w800,
          //                                     fontSize: 18,
          //                                     color: Colors.white
          //                                   ),
          //                                 ),
          //                                 Text(
          //                                   "Laporan Informasi Harian",
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w700,
          //                                       fontSize: 16,
          //                                       color: Colors.white),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //     const SizedBox(
          //       height: 55,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
