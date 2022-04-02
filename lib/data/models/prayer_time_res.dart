class PrayerTimeRes {
  final int? code;
  final String? status;
  final Results? results;

  PrayerTimeRes({
    this.code,
    this.status,
    this.results,
  });

  PrayerTimeRes.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        status = json['status'] as String?,
        results = (json['results'] as Map<String, dynamic>?) != null
            ? Results.fromJson(json['results'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'code': code, 'status': status, 'results': results?.toJson()};
}

class Results {
  final List<Datetime>? datetime;
  final Location? location;
  final Settings? settings;

  Results({
    this.datetime,
    this.location,
    this.settings,
  });

  Results.fromJson(Map<String, dynamic> json)
      : datetime = (json['datetime'] as List?)
            ?.map((dynamic e) => Datetime.fromJson(e as Map<String, dynamic>))
            .toList(),
        location = (json['location'] as Map<String, dynamic>?) != null
            ? Location.fromJson(json['location'] as Map<String, dynamic>)
            : null,
        settings = (json['settings'] as Map<String, dynamic>?) != null
            ? Settings.fromJson(json['settings'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'datetime': datetime?.map((e) => e.toJson()).toList(),
        'location': location?.toJson(),
        'settings': settings?.toJson()
      };
}

class Datetime {
  final Times? times;
  final Date? date;

  Datetime({
    this.times,
    this.date,
  });

  Datetime.fromJson(Map<String, dynamic> json)
      : times = (json['times'] as Map<String, dynamic>?) != null
            ? Times.fromJson(json['times'] as Map<String, dynamic>)
            : null,
        date = (json['date'] as Map<String, dynamic>?) != null
            ? Date.fromJson(json['date'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'times': times?.toJson(), 'date': date?.toJson()};
}

class Times {
  final String? imsak;
  final String? sunrise;
  final String? fajr;
  final String? dhuhr;
  final String? asr;
  final String? sunset;
  final String? maghrib;
  final String? isha;
  final String? midnight;

  Times({
    this.imsak,
    this.sunrise,
    this.fajr,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.midnight,
  });

  Times.fromJson(Map<String, dynamic> json)
      : imsak = json['Imsak'] as String?,
        sunrise = json['Sunrise'] as String?,
        fajr = json['Fajr'] as String?,
        dhuhr = json['Dhuhr'] as String?,
        asr = json['Asr'] as String?,
        sunset = json['Sunset'] as String?,
        maghrib = json['Maghrib'] as String?,
        isha = json['Isha'] as String?,
        midnight = json['Midnight'] as String?;

  Map<String, dynamic> toJson() => {
        'Imsak': imsak,
        'Sunrise': sunrise,
        'Fajr': fajr,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Sunset': sunset,
        'Maghrib': maghrib,
        'Isha': isha,
        'Midnight': midnight
      };
}

class Date {
  final int? timestamp;
  final String? gregorian;
  final String? hijri;

  Date({
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  Date.fromJson(Map<String, dynamic> json)
      : timestamp = json['timestamp'] as int?,
        gregorian = json['gregorian'] as String?,
        hijri = json['hijri'] as String?;

  Map<String, dynamic> toJson() =>
      {'timestamp': timestamp, 'gregorian': gregorian, 'hijri': hijri};
}

class Location {
  final double? latitude;
  final double? longitude;
  final double? elevation;
  final String? ipAddress;
  final String? city;
  final String? country;
  final String? countryCode;
  final String? timezone;
  final double? localOffset;

  Location({
    this.latitude,
    this.longitude,
    this.elevation,
    this.ipAddress,
    this.city,
    this.country,
    this.countryCode,
    this.timezone,
    this.localOffset,
  });

  Location.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'] as double?,
        longitude = json['longitude'] as double?,
        elevation = json['elevation'] as double?,
        ipAddress = json['ip_address'] as String?,
        city = json['city'] as String?,
        country = json['country'] as String?,
        countryCode = json['country_code'] as String?,
        timezone = json['timezone'] as String?,
        localOffset = json['local_offset'] as double?;

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'elevation': elevation,
        'ip_address': ipAddress,
        'city': city,
        'country': country,
        'country_code': countryCode,
        'timezone': timezone,
        'local_offset': localOffset
      };
}

class Settings {
  final String? timeformat;
  final String? school;
  final String? juristic;
  final String? highlat;
  final double? fajrAngle;
  final double? ishaAngle;

  Settings({
    this.timeformat,
    this.school,
    this.juristic,
    this.highlat,
    this.fajrAngle,
    this.ishaAngle,
  });

  Settings.fromJson(Map<String, dynamic> json)
      : timeformat = json['timeformat'] as String?,
        school = json['school'] as String?,
        juristic = json['juristic'] as String?,
        highlat = json['highlat'] as String?,
        fajrAngle = json['fajr_angle'] as double?,
        ishaAngle = json['isha_angle'] as double?;

  Map<String, dynamic> toJson() => {
        'timeformat': timeformat,
        'school': school,
        'juristic': juristic,
        'highlat': highlat,
        'fajr_angle': fajrAngle,
        'isha_angle': ishaAngle
      };
}
