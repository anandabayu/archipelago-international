import 'package:archipelagointernational/app/model/hotel.dart';
import 'package:archipelagointernational/app/widget/app_button.dart';
import 'package:archipelagointernational/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  final Hotel hotel;

  const DetailScreen({super.key, required this.hotel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int? maxLines = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(widget.hotel.name)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: widget.hotel.image,
                        child: Image.asset(
                          "images/${widget.hotel.image}",
                          fit: BoxFit.cover,
                          height: 250,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8,
                        left: 8,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                            child: const Center(child: Icon(Icons.arrow_back_rounded)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8,
                        right: 8,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                          child: const Center(
                              child: Icon(
                            Icons.favorite_rounded,
                            color: pink,
                          )),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.hotel.name,
                          style: fontH(20, color: darkBlue),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (widget.hotel.type == HotelType.hotel)
                          RatingBarIndicator(
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 16,
                            rating: widget.hotel.grade.toDouble(),
                          ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: pink,
                              size: 24,
                            ),
                            Text(
                              widget.hotel.address,
                              style: fontR(14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Details",
                          style: fontH(16, color: darkBlue),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ReadMoreText(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          trimLines: 5,
                          style: fontR(14, color: gray900),
                          colorClickableText: pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: ' show less',
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Amenities",
                          style: fontH(16, color: darkBlue),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 16),
                        amenitiesIcon("Wi-Fi", Icons.wifi, Colors.green[300]),
                        const SizedBox(width: 16),
                        amenitiesIcon("AC", Icons.ac_unit_rounded, Colors.blue[300]),
                        const SizedBox(width: 16),
                        amenitiesIcon("Accessibility", Icons.wheelchair_pickup_rounded, Colors.cyan[300]),
                        const SizedBox(width: 16),
                        amenitiesIcon("Restaurant", Icons.restaurant_menu_rounded, Colors.yellow[700]),
                        const SizedBox(width: 16),
                        amenitiesIcon("Elevator", Icons.elevator_rounded, Colors.grey[800]),
                        const SizedBox(width: 16),
                        amenitiesIcon("Parking", Icons.local_parking_rounded, Colors.purple[200]),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(-2, -3),
                ),
              ],
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.hotel.getPrice(),
                      style: fontH(
                        20,
                        color: pink,
                      ),
                    ),
                    Text(
                      " / night",
                      style: fontR(12, color: Colors.grey[700]),
                    )
                  ],
                ),
                AppButton(
                  title: "Select Room",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget amenitiesIcon(String text, IconData icon, Color? color) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color?.withOpacity(0.3),
          ),
          child: Center(
            child: Icon(
              icon,
              color: color,
              size: 35,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          text,
          style: fontR(12, color: gray900),
        ),
      ],
    );
  }
}
