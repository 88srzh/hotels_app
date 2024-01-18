import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/domain/api_client/network_client.dart';
import 'package:hotel_app/domain/entity/about_the_hotel.dart';
import 'package:hotel_app/domain/entity/hotel.dart';
import 'package:hotel_app/resources/app_colors.dart';
import 'package:hotel_app/resources/resources.dart';
import 'package:hotel_app/ui/components/build_dot_animated_container.dart';
import 'package:hotel_app/ui/components/custom_bottom_navigation_bar.dart';
import 'package:hotel_app/ui/components/five_star_row.dart';
import 'package:hotel_app/ui/components/loading_indicator_widget.dart';
import 'package:hotel_app/ui/components/headline_text_widget.dart';
import 'package:hotel_app/ui/widgets/Room/room_widget.dart';
import 'package:hotel_app/ui/widgets/hotel/components/about_hotel_widget.dart';

class HotelWidget extends StatefulWidget {
  const HotelWidget({super.key});

  @override
  State<HotelWidget> createState() => _HotelWidgetState();
}

class _HotelWidgetState extends State<HotelWidget> {
  var hotel = Hotel(
    id: 0,
    name: '',
    adress: '',
    minimalPrice: 0,
    priceForIt: '',
    rating: 0,
    ratingName: '',
    imageUrls: [],
    aboutTheHotel: AboutTheHotel(description: '', peculiarities: []),
  );

  void getHotelData() async {
    final hotelJson = await getNetworkDataForHotel();
    final dynamic hotelMap = json.decode(hotelJson);

    setState(() {
      hotel = Hotel.fromJson(hotelMap);
    });
  }

  @override
  void initState() {
    super.initState();
    getHotelData();
  }

  int _currentPhoto = 0;

  @override
  Widget build(BuildContext context) {
    final String startHotelMinimalPrice = hotel.minimalPrice.toStringAsFixed(4).substring(0, 3);
    final String endHotelMinimalPrice = hotel.minimalPrice.toStringAsFixed(4).substring(3, 6);
    var peculiarities = makeHotelPeculiarities(hotel);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Отель',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 429.0,
                // width: 375.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 257,
                            // width: 343,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: PageView.builder(
                              onPageChanged: (value) {
                                setState(() {
                                  _currentPhoto = value;
                                });
                              },
                              itemCount: hotel.imageUrls.length,
                              itemBuilder: (BuildContext context, int index) {
                                final image = hotel.imageUrls[index];
                                return Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: image,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                    placeholder: (context, url) => const LoadingIndicatorWidget(),
                                    errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImage),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 40,
                            right: 50,
                            bottom: 10,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 17.0,
                                width: 75.0,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      5,
                                      (index) => buildDot(index: index, currentPhoto: _currentPhoto),
                                      growable: false,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FiveStarRowWidget(rating: hotel.rating.toString(), ratingName: hotel.ratingName),
                          const HeadlineTextWidget(text: 'Steigenberger Makadi'),
                          Text(
                            hotel.adress,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.blueText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                'от $startHotelMinimalPrice $endHotelMinimalPrice ₽',
                                style: const TextStyle(
                                  textBaseline: TextBaseline.ideographic,
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              const Text(
                                'за тур с перелётом',
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(height: 10.0),
              // about the hotel
              AboutHotelWidget(peculiarities: peculiarities, hotel: hotel),
              const SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        text: 'К выбору номера',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomWidget()));
        },
      ),
    );
  }

  String makeHotelPeculiarities(Hotel hotel) {
    var texts = <String>[];
    if (hotel.aboutTheHotel.peculiarities.isNotEmpty) {
      var names = <String>[];
      for (var name in hotel.aboutTheHotel.peculiarities) {
        names.add(name.characters.string);
      }
      // texts.add(names.join('\n'));
      texts.add(names.join('\n'));
    }
    return texts.join(' ');
    // return myList.toString();
  }
}
