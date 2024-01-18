import 'package:equatable/equatable.dart';
import 'package:hotel_app/domain/entity/hotel.dart';

class HotelContainer extends Equatable {
  final List<Hotel> hotels;
  final int currentPage;

  const HotelContainer.initial()
      : hotels = const <Hotel>[],
        currentPage = 0;

  const HotelContainer({
    required this.hotels,
    required this.currentPage,
  });

  @override
  List<Object> get props => [hotels, currentPage];

  HotelContainer copyWith({
    List<Hotel>? hotels,
    int? currentPage,
  }) {
    return HotelContainer(
      hotels: hotels ?? this.hotels,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
