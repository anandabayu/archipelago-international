import 'package:archipelagointernational/app/cubit/app_cubit.dart';
import 'package:archipelagointernational/app/cubit/app_state.dart';
import 'package:archipelagointernational/app/widget/hotel_list.dart';
import 'package:archipelagointernational/app/widget/search_form.dart';
import 'package:archipelagointernational/injection/injection.dart';
import 'package:archipelagointernational/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        bloc: getIt<AppCubit>(),
        listener: (context, state) {},
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Book a Room",
                      style: fontH(
                        24,
                        color: darkBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const SearchForm(),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Last Viewed",
                      style: fontH(
                        20,
                        color: darkBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: HotelList(hotels: state.hotels),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
