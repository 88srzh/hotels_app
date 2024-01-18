import 'package:hotel_app/domain/entity/hotel.dart';

class HotelList {
  List<Hotel> hotels;

  HotelList({
    required this.hotels,
  });

  factory HotelList.fromJson(final dynamic json) {
    return HotelList(
      hotels: (json as List<dynamic>).map((dynamic e) => Hotel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
