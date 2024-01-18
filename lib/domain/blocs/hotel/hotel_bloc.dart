/*
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotel_app/configuration/configuration.dart';
import 'package:hotel_app/domain/api_client/hotel_api_client.dart';
import 'package:hotel_app/domain/entity/hotel.dart';
import 'package:hotel_app/domain/entity/hotel_response.dart';
import 'package:hotel_app/ui/widgets/hotel/components/hotel_container.dart';

part 'hotel_bloc.freezed.dart';

part 'hotel_event.dart';

part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final _apiClient = HotelApiClient();

  HotelBloc(HotelState initialState) : super(initialState) {
    on<HotelEvent>(((event, emit) async {
      if (event is HotelEventLoadPage) {
        await onHotelEventLoadPage(event, emit);
      } else if (event is HotelEventReset) {
        await onHotelEventReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onHotelEventLoadPage(HotelEventLoadPage event, Emitter<HotelState> emit) async {
    final container = await loadPage(state.hotelContainer, (nextPage) async {
      final result = await _apiClient.hotel(Configuration.apiKey);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(hotelContainer: container);
      emit(newState);
    }
  }

  Future<HotelContainer?> loadPage(HotelContainer container, Future<HotelResponse> Function(int) loader) async {
    final nextPage = state.hotelContainer.currentPage + 1;
    final result = await loader(nextPage);
    final hotels = List<Hotel>.from(container.hotels)..addAll(result.hotel);
    final newContainer = container.copyWith(
      hotels: hotels,
    );
    return newContainer;
  }

  Future<void> onHotelEventReset(HotelEventReset event, Emitter<HotelState> emit) async {
    emit(const HotelState.initial());
  }
}
*/
