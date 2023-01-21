import 'package:rick_morty/feature/domain/entities/location_enitity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required id,
    required name,
    required type,
    required dimension,
    required residents,
  }) : super(
          id: id,
          name: name,
          type: type,
          dimension: dimension,
          residents: residents,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      dimension: json['dimension'] as String,
      residents:
          (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'dimension': dimension,
      'residents': residents,
    };
  }
}
