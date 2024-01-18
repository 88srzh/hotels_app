import 'package:hotel_app/ui/widgets/hotel/components/hotel_data.dart';

class HotelCubitState {
  final List<HotelData> hotels;

  const HotelCubitState({
    required this.hotels,
  });

  @override
  String toString() {
    return 'HotelCubitState{hotels: $hotels}';
  }

  HotelCubitState copyWith({
    List<HotelData>? hotels,
  }) {
    return HotelCubitState(
      hotels: hotels ?? this.hotels,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is HotelCubitState && runtimeType == other.runtimeType && hotels == other.hotels;

  @override
  int get hashCode => hotels.hashCode;
}
