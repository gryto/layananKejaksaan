import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layanan_kejaksaan/gen/assets.gen.dart';
import '../src/preference.dart';
import 'screen/luggage/page.dart';
import 'screen/profile/page.dart';
import 'src/api.dart';
import 'src/constant.dart';
import 'src/toast.dart';
import 'src/utils.dart';
import 'package:http/http.dart' as http;

import 'widgets/smart_device.dart';

class MainTabBar extends StatefulWidget {
  final id;
  const MainTabBar({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
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
    getData(widget.id);
    getDataLayanan();
    super.initState();
  }

  getData(id) async {
    pages = [
      // ChatRoomPage(senderId: userId.toString(), data: listDataHistoryDay, image: path),
    ];
    try {
      var accessToken = await sharedPref.getPref("access_token");
      print("accestoke");
      print(accessToken);
      var url = ApiService.detailUser;
      var uri = "$url/$id";
      var bearerToken = 'Bearer $accessToken';
      var response = await http.get(Uri.parse(uri),
          headers: {"Authorization": bearerToken.toString()});

      if (response.statusCode == 200) {
        setState(() {
          var content = json.decode(response.body);

          fullname = content['data']['fullname'];
          division = content['data']['getrole']['name'];
          listData.add(content['data']);
          userId = content['data']['id'];
          path = content['data']['image'];
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

  getDataLayanan() async {
    pages = [
      // ChatRoomPage(senderId: userId.toString(), data: listDataHistoryDay, image: path),
    ];
    try {
      var accessToken = await sharedPref.getPref("access_token");
      print("accestoke");
      print(accessToken);
      var url = ApiService.getLayanan;
      var uri = url;
      var bearerToken = 'Bearer $accessToken';
      var response = await http.get(Uri.parse(uri),
          headers: {"Authorization": bearerToken.toString()});

      if (response.statusCode == 200) {
        setState(() {
          var content = json.decode(response.body);
          listDataLayanan = content['data'];

          print("listisidentil");

          // fullname = content['data']['fullname'];
          // division = content['data']['getrole']['name'];
          // listData.add(content['data']);
          // userId = content['data']['id'];
          // path = content['data']['image'];

          print(listData);
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
    double w = MediaQuery.of(context).size.width - 0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: clrPrimary,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
            child: Text(
              'Layanan Kejaksaan',
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 105,
                    decoration: const BoxDecoration(
                      color: clrPrimary,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, right: 0, bottom: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 0, right: 0, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingLogic(id: widget.id),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  '${ApiService.folder}/$path',
                                                  scale: 10,
                                                ),
                                                fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            fullname,
                                            style: SafeGoogleFont(
                                              'SF Pro Text',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2575,
                                              letterSpacing: 1,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            division,
                                            style: SafeGoogleFont(
                                              'SF Pro Text',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              height: 1.2575,
                                              letterSpacing: 1,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GridView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemCount: listDataLayanan.isEmpty ? 0 : listDataLayanan.length,
                itemBuilder: (BuildContext context, int index) {
                  var row = listDataLayanan[index];

                  print("row");
                  print(row);

                  // Data from listDataLayanan
                  final String smartDeviceName = row['nama_layanan'];
                  const Color smartDeviceColor = Colors.white;
                  var image = row['image'];
                  print("gambar");
                  print(image);
                  final String imageProvider = '${ApiService.folder}/$image';
                  // final Widget destinationPage = row['page'];


                  print("namee");

                  print(smartDeviceName );

                  // Using GestureDetector within itemBuilder
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LuggagePage(id: row['id']),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      child: SmartDeviceBoxWidget(
                        width: MediaQuery.of(context).size.width / 6,
                        smartDeviceName: smartDeviceName,
                        smartDeviceColor: smartDeviceColor,
                        imageProvider: imageProvider,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
