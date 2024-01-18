/*
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/domain/blocs/hotel/hotel_bloc.dart';
import 'package:hotel_app/domain/entity/about_the_hotel.dart';
import 'package:hotel_app/domain/entity/hotel.dart';
import 'package:hotel_app/ui/widgets/hotel/components/hotel_cubit_state.dart';
import 'package:hotel_app/ui/widgets/hotel/components/hotel_data.dart';

class HotelCubit extends Cubit<HotelCubitState> {
  final HotelBloc hotelBloc;
  late final StreamSubscription<HotelState> hotelSubscription;

  HotelCubit({required this.hotelBloc}) : super(const HotelCubitState(hotels: <HotelData>[])) {
    Future.microtask(
      () {
        _onState(hotelBloc.state);
        hotelSubscription = hotelBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(HotelState state) {
    final hotels = state.hotels.map(_makeListData).toList();
    final newState = this.state.copyWith(hotels: hotels);
    emit(newState);
  }

  HotelData _makeListData(Hotel hotel) {
    return HotelData(
      id: hotel.id,
      name: hotel.name,
      adress: hotel.adress,
      minimalPrice: hotel.minimalPrice,
      priceForIt: hotel.priceForIt,
      rating: hotel.rating,
      ratingName: hotel.ratingName,
      imageUrls: hotel.imageUrls,
      aboutTheHotel: AboutTheHotel(description: hotel.aboutTheHotel.description, peculiarities: hotel.aboutTheHotel.peculiarities),
    );
  }

  void showedHotel(int index) {
    hotelBloc.add(const HotelEvent.loadPage());
  }

  void setupHotel() {
    hotelBloc.add(const HotelEventReset());
    hotelBloc.add(const HotelEventLoadPage());
  }
}
*/
