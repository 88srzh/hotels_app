/*
part of 'hotel_bloc.dart';

class HotelState extends Equatable {
  final HotelContainer hotelContainer;

  List<Hotel> get hotels => hotelContainer.hotels;

  @override
  List<Object> get props => [hotelContainer];

  const HotelState.initial() : hotelContainer = const HotelContainer.initial();

  const HotelState({
    required this.hotelContainer,
  });

  HotelState copyWith({
    HotelContainer? hotelContainer,
  }) {
    return HotelState(
      hotelContainer: hotelContainer ?? this.hotelContainer,
    );
  }
}*/
