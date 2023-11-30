import 'package:archipelagointernational/app/model/hotel.dart';

class AppState {
  final List<Hotel> hotels;

  AppState({
    required this.hotels,
  });

  factory AppState.initial() => AppState(
        hotels: initialHotel(),
      );

  AppState copyWith({
    List<Hotel>? hotels,
  }) {
    return AppState(
      hotels: hotels ?? this.hotels,
    );
  }
}
