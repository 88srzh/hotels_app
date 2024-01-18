import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotel_app/domain/entity/about_the_hotel.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Hotel {
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;

  final List<String> imageUrls;
  final AboutTheHotel aboutTheHotel;

  const Hotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelToJson(this);
}
