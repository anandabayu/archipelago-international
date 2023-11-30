import 'package:archipelagointernational/app/model/hotel.dart';
import 'package:archipelagointernational/app/page/detail_screen.dart';
import 'package:archipelagointernational/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelList extends StatefulWidget {
  final List<Hotel> hotels;
  const HotelList({
    super.key,
    required this.hotels,
  });

  @override
  State<HotelList> createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.hotels
            .map((element) => GestureDetector(
                  child: hotelTile(element),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(
                        hotel: element,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget hotelTile(Hotel hotel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: darkBlue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image(hotel.image),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              height: 175,
              margin: const EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    hotel.name,
                    style: fontR(18, color: darkBlue),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    hotel.address,
                    style: fontR(14, color: Colors.grey[700]),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  if (hotel.type == HotelType.hotel)
                    RatingBarIndicator(
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 16,
                      rating: hotel.grade.toDouble(),
                    ),
                  const Spacer(),
                  Text(
                    "Starts from",
                    style: fontR(
                      14,
                      color: Colors.grey[400],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        hotel.getPrice(),
                        style: fontM(16, color: pink),
                      ),
                      Text(
                        " / per room per night",
                        style: fontR(12, color: Colors.grey[700]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image(String name) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
      child: Hero(
        tag: name,
        child: Image.asset(
          "images/$name",
          fit: BoxFit.cover,
          height: 175,
          width: 120,
        ),
      ),
    );
  }
}
