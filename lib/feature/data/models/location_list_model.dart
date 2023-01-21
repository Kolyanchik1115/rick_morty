import 'package:rick_morty/feature/domain/entities/character_enitity.dart';

class LocationListModel extends LocationListEntity {
  const LocationListModel({name, url}) : super(name: name, url: url);

  factory LocationListModel.fromJson(Map<String, dynamic> json) {
    return LocationListModel(
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
