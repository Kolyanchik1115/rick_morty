import 'package:rick_morty/feature/domain/entities/character_enitity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({name, url}) : super(name: name, url: url);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
