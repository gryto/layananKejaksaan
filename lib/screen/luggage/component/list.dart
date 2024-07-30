import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '../../../src/api.dart';
import '../../../src/constant.dart';

class LayananList extends StatelessWidget {
  final data;
  const LayananList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          padding:
              const EdgeInsets.only(bottom: 5, top: 5, left: 5.0, right: 5.0),
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, index) {
            var row = data[index];

            return GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => ActivityDetail(
                //       activityUser: row['username'] ?? "",
                //       activityIp: row['ip_address'] ?? "",
                //       activityBrowser: row['browser'] ?? "",
                //       activityPlatform: row['platform'] ?? "",
                //       activityDescription: row['activity'] ?? "",
                //       activityCreated: row['created_at'] ?? "",
                //       activityUpdated: row['updated_at'] ?? "",
                //     ),
                //   ),
                // );
              },
              child: Container(
                padding:
                    const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: clrPrimary),
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage(
                                  ApiService.imgDefault,
                                  scale: 10,
                                ),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              row['nama'] ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Text(
                              row['keperluan'] ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              row['getsatker']['kode_satker'] ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              row['getsatker']['nama_satker'] ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10,),
                            badges.Badge(
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.square,
                                borderRadius: BorderRadius.circular(5),
                                badgeColor: row['status_tindak_lanjut'] ==
                                        const Text("sudah ditindak lanjuti")
                                    ? clrDone
                                    : clrDelete,
                              ),
                              position: badges.BadgePosition.custom(
                                  start: 10, top: 10),
                              badgeContent: Text(
                                row['status_tindak_lanjut'] ?? "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, index) => const SizedBox(
            height: 5,
          ),
          itemCount: data.isEmpty ? 0 : data.length,
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_clock,
                  size: 90.0,
                  color: Colors.grey.shade400,
                ),
                Text(
                  "Ooops, Username Yang Kamu Cari Tidak Ada!",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      );
    }
  }
}
