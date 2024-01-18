import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Rooms {
  final List<Room> rooms;

  const Rooms({
    required this.rooms,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Room {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

  const Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
