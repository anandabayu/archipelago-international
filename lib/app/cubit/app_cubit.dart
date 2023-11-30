import 'package:archipelagointernational/app/cubit/app_state.dart';
import 'package:archipelagointernational/app/model/hotel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());

  Future<void> search(String? keyword) async {
    List<Hotel> hotels = initialHotel();

    if (keyword != null && keyword.isNotEmpty) {
      hotels = initialHotel()
          .where(
            (hotel) =>
                hotel.city.toLowerCase() == keyword.toLowerCase() ||
                searchString(
                  hotel.name.toLowerCase(),
                  keyword,
                ),
          )
          .toList();
    }

    emit(state.copyWith(
      hotels: hotels,
    ));
  }

  bool searchString(String data, String keyword) {
    if (data == keyword) return true;

    int count = 0;
    var searchList = keyword.split(" ");
    for (final searchWord in searchList) {
      if (data.contains(searchWord)) count++;
    }

    return count == searchList.length;
  }
}
