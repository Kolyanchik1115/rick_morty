import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;

  const LocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        residents,
      ];
}

