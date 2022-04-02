import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_tasks/app/config/app_colors.dart';
import 'package:getx_tasks/app/utils/row_of_the_table.dart';
import 'package:getx_tasks/presentation/controller/prayer_time_controller/prayer_time_controller.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final PrayerTimeController c = Get.put(PrayerTimeController());

    return Scaffold(
        appBar: AppBar(title: const Text('Landing Page')),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [const Color(0xFF6ba7cd), AppColors.themeGreen2],
            ),
          ),
          child: Column(
            children: [
              Obx(() => c.isPopulated.value
                  ? Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(20.0),
                      child: Table(
                          border:
                              TableBorder.all(color: AppColors.goldenEmboss),
                          children: [
                            TableRow(children: [
                              const RowOfTheTable(
                                str: 'imsak',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.imsak ??
                                    "",
                              )
                            ]),
                            TableRow(children: [
                              // ignore: prefer_const_constructors
                              RowOfTheTable(
                                str: 'Fajr',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.fajr ??
                                    "",
                              )
                            ]),
                            TableRow(children: [
                              // ignore: prefer_const_constructors
                              RowOfTheTable(
                                str: 'sunrise',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.sunrise ??
                                    "",
                              )
                            ]),
                            TableRow(children: [
                              const RowOfTheTable(
                                str: 'Dhuhr',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.dhuhr ??
                                    "",
                              )
                            ]),
                            TableRow(children: [
                              const RowOfTheTable(
                                str: 'Asr',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.asr ??
                                    "",
                              )
                            ]),
                            TableRow(children: [
                              const RowOfTheTable(
                                str: 'sunset',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.sunset ??
                                    "",
                              )
                            ]),
                            TableRow(children: [
                              const RowOfTheTable(
                                str: 'Maghrib',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.maghrib ??
                                    "",
                              )
                            ]),
                            TableRow(children: [
                              const RowOfTheTable(
                                str: 'Isha',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.isha ??
                                    "",
                              )
                            ]),
                            TableRow(children: [
                              const RowOfTheTable(
                                str: 'midnight',
                              ),
                              RowOfTheTable(
                                str: c.prayerTimeRes.value.results!.datetime![0]
                                        .times!.midnight ??
                                    "",
                              )
                            ]),
                          ]))
                  : const Center(
                      child: CircularProgressIndicator(),
                    ))
            ],
          ),
        ));
  }
}
