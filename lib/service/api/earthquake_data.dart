class EarthquakeData {
  final String? id;
  final String? earthquakeId;
  final String? provider;
  final String? title;
  final String? date;
  final int? mag;
  final double? depth;
  final Geojson? geojson;
  final LocationProperties? locationProperties;
  final dynamic rev;
  final String? dateTime;
  final int? createdAt;
  final String? locationTz;

  EarthquakeData({
    this.id,
    this.earthquakeId,
    this.provider,
    this.title,
    this.date,
    this.mag,
    this.depth,
    this.geojson,
    this.locationProperties,
    this.rev,
    this.dateTime,
    this.createdAt,
    this.locationTz,
  });

  EarthquakeData.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        earthquakeId = json['earthquake_id'] as String?,
        provider = json['provider'] as String?,
        title = json['title'] as String?,
        date = json['date'] as String?,
        mag = json['mag'] as int?,
        depth = json['depth'] as double?,
        geojson = (json['geojson'] as Map<String, dynamic>?) != null
            ? Geojson.fromJson(json['geojson'] as Map<String, dynamic>)
            : null,
        locationProperties =
            (json['location_properties'] as Map<String, dynamic>?) != null
                ? LocationProperties.fromJson(
                    json['location_properties'] as Map<String, dynamic>)
                : null,
        rev = json['rev'],
        dateTime = json['date_time'] as String?,
        createdAt = json['created_at'] as int?,
        locationTz = json['location_tz'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'earthquake_id': earthquakeId,
        'provider': provider,
        'title': title,
        'date': date,
        'mag': mag,
        'depth': depth,
        'geojson': geojson?.toJson(),
        'location_properties': locationProperties?.toJson(),
        'rev': rev,
        'date_time': dateTime,
        'created_at': createdAt,
        'location_tz': locationTz
      };
}

class Geojson {
  final String? type;
  final List<double>? coordinates;

  Geojson({
    this.type,
    this.coordinates,
  });

  Geojson.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        coordinates = (json['coordinates'] as List?)
            ?.map((dynamic e) => e as double)
            .toList();

  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};
}

class LocationProperties {
  final ClosestCity? closestCity;
  final EpiCenter? epiCenter;
  final List<ClosestCities>? closestCities;
  final List<Airports>? airports;

  LocationProperties({
    this.closestCity,
    this.epiCenter,
    this.closestCities,
    this.airports,
  });

  LocationProperties.fromJson(Map<String, dynamic> json)
      : closestCity = (json['closestCity'] as Map<String, dynamic>?) != null
            ? ClosestCity.fromJson(json['closestCity'] as Map<String, dynamic>)
            : null,
        epiCenter = (json['epiCenter'] as Map<String, dynamic>?) != null
            ? EpiCenter.fromJson(json['epiCenter'] as Map<String, dynamic>)
            : null,
        closestCities = (json['closestCities'] as List?)
            ?.map((dynamic e) =>
                ClosestCities.fromJson(e as Map<String, dynamic>))
            .toList(),
        airports = (json['airports'] as List?)
            ?.map((dynamic e) => Airports.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'closestCity': closestCity?.toJson(),
        'epiCenter': epiCenter?.toJson(),
        'closestCities': closestCities?.map((e) => e.toJson()).toList(),
        'airports': airports?.map((e) => e.toJson()).toList()
      };
}

class ClosestCity {
  final String? name;
  final int? cityCode;
  final double? distance;
  final int? population;

  ClosestCity({
    this.name,
    this.cityCode,
    this.distance,
    this.population,
  });

  ClosestCity.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        cityCode = json['cityCode'] as int?,
        distance = json['distance'] as double?,
        population = json['population'] as int?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'cityCode': cityCode,
        'distance': distance,
        'population': population
      };
}

class EpiCenter {
  final String? name;
  final int? cityCode;
  final int? population;

  EpiCenter({
    this.name,
    this.cityCode,
    this.population,
  });

  EpiCenter.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        cityCode = json['cityCode'] as int?,
        population = json['population'] as int?;

  Map<String, dynamic> toJson() =>
      {'name': name, 'cityCode': cityCode, 'population': population};
}

class ClosestCities {
  final String? name;
  final int? cityCode;
  final double? distance;
  final int? population;

  ClosestCities({
    this.name,
    this.cityCode,
    this.distance,
    this.population,
  });

  ClosestCities.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        cityCode = json['cityCode'] as int?,
        distance = json['distance'] as double?,
        population = json['population'] as int?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'cityCode': cityCode,
        'distance': distance,
        'population': population
      };
}

class Airports {
  final double? distance;
  final String? name;
  final String? code;
  final Coordinates? coordinates;

  Airports({
    this.distance,
    this.name,
    this.code,
    this.coordinates,
  });

  Airports.fromJson(Map<String, dynamic> json)
      : distance = json['distance'] as double?,
        name = json['name'] as String?,
        code = json['code'] as String?,
        coordinates = (json['coordinates'] as Map<String, dynamic>?) != null
            ? Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'distance': distance,
        'name': name,
        'code': code,
        'coordinates': coordinates?.toJson()
      };
}

class Coordinates {
  final String? type;
  final List<double>? coordinates;

  Coordinates({
    this.type,
    this.coordinates,
  });

  Coordinates.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        coordinates = (json['coordinates'] as List?)
            ?.map((dynamic e) => e as double)
            .toList();

  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};
}
