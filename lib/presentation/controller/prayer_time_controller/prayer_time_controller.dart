import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/models/prayer_time_res.dart';
import '../../../data/network/api_end_point.dart';
import '../../../data/network/api_methods.dart';

class PrayerTimeController extends GetxController {
  @override
  void onInit() {
    count++;
    fetchPrayerTime();
    super.onInit();
  }

  var isPopulated = false.obs;
  final prayerTimeRes = PrayerTimeRes(
    results: Results(
      datetime: [
        Datetime(
          times: Times(
            fajr: '',
            dhuhr: '',
            asr: '',
            maghrib: '',
            isha: '',
            sunrise: '',
            imsak: '',
            midnight: '',
            sunset: '',
          ),
        )
      ],
    ),
  ).obs;

  final List salatList = [
    {
      'img': 'assets/image/fajr.jpg',
      'salat': 'Fajr',
      'salat_time': '',
    },
    {
      'img': 'assets/image/johar.jpg',
      'salat': 'Dhuhr',
      'salat_time': '',
    },
    {
      'img': 'assets/image/asr.jpg',
      'salat': 'Asr',
      'salat_time': '',
    },
    {
      'img': 'assets/image/magrib.jpg',
      'salat': 'Maghrib',
      'salat_time': '',
    },
    {
      'img': 'assets/image/esha.jpg',
      'salat': 'Isha',
      'salat_time': '',
    },
  ].obs;

  void fetchPrayerTime() async {
    var response = await ApiMethod(true).get(ApiUrls.dhakaApi);
    if (response != null) {
      prayerTimeRes.value = PrayerTimeRes.fromJson(response);

      salatList[0]['salat_time'] =
          prayerTimeRes.value.results!.datetime![0].times!.fajr;
      salatList[1]['salat_time'] =
          prayerTimeRes.value.results!.datetime![0].times!.dhuhr;
      salatList[2]['salat_time'] =
          prayerTimeRes.value.results!.datetime![0].times!.asr;
      salatList[3]['salat_time'] =
          prayerTimeRes.value.results!.datetime![0].times!.maghrib;
      salatList[4]['salat_time'] =
          prayerTimeRes.value.results!.datetime![0].times!.isha;
      isPopulated.value = true;
      debugPrint('fetching');
      debugPrint(isPopulated.value.toString());
    }
    // update();
  }

  var count = 0.obs;
  increment() => count++;
}
