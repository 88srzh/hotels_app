import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/domain/api_client/network_client.dart';
import 'package:hotel_app/domain/entity/room.dart';
import 'package:hotel_app/resources/app_colors.dart';
import 'package:hotel_app/resources/resources.dart';
import 'package:hotel_app/ui/components/build_dot_animated_container.dart';
import 'package:hotel_app/ui/components/custom_app_bar_widget.dart';
import 'package:hotel_app/ui/components/loading_indicator_widget.dart';
import 'package:hotel_app/ui/components/headline_text_widget.dart';
import 'package:hotel_app/ui/widgets/Reservation/reservation_widget.dart';

class RoomWidget extends StatefulWidget {
  const RoomWidget({super.key});

  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  var roomList = const Rooms(rooms: []);

  void getRoomData() async {
    final roomListJson = await getNetworkDataForRoom();
    final dynamic roomListMap = json.decode(roomListJson);

    setState(() {
      roomList = Rooms.fromJson(roomListMap);
    });
  }

  @override
  void initState() {
    super.initState();
    getRoomData();
  }

  int _currentPhoto = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Steigenberger Makadi'),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: ListView.builder(
          itemCount: roomList.rooms.length,
          itemBuilder: (context, index) {
            final String startHotelMinimalPrice = roomList.rooms[index].price.toStringAsFixed(4).substring(0, 3);
            final String endHotelMinimalPrice = roomList.rooms[index].price.toStringAsFixed(4).substring(3, 6);
            var peculiarities = makeRoomPeculiarities(roomList, index);
            return Column(
              children: [
                const SizedBox(height: 10.0),
                Container(
                  height: 539.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 257,
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
                                itemCount: roomList.rooms.length,
                                itemBuilder: (context, index) {
                                  final image = roomList.rooms[index].imageUrls[index];
                                  return Container(
                                    // TODO image not round
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    // TODO добавить проверку на корректность ссылки
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
                                        3,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadlineTextWidget(text: roomList.rooms[index].name),
                            Text(
                              peculiarities,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyText,
                                backgroundColor: AppColors.greyBackgroundText,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              width: 192.0,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: AppColors.roomDetailsBackgroundColor,
                              ),
                              child: InkWell(
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 2.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Подробнее о номере',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.roomDetailsTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Image.asset(AppImages.forwardArrow),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '$startHotelMinimalPrice $endHotelMinimalPrice ₽',
                                  style: const TextStyle(
                                    textBaseline: TextBaseline.ideographic,
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  roomList.rooms[index].pricePer.toLowerCase(),
                                  style: const TextStyle(
                                    color: AppColors.greyText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              width: double.infinity,
                              height: 88,
                              child: Center(
                                child: SizedBox(
                                  width: 343,
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                      backgroundColor: AppColors.hotelBottomButtonColor,
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      'К выбору номера',
                                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ReservationWidget(onSubmit: (value) => print(value)),
                                        ),
                                      );
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SubmitPage()));
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // TODO refactor to separate file

  String makeRoomPeculiarities(Rooms roomList, int index) {
    var texts = <String>[];
    if (roomList.rooms.isNotEmpty) {
      var names = <String>[];
      for (var name in roomList.rooms[index].peculiarities) {
        names.add(name.characters.string);
      }
      texts.add(names.join('     '));
    }
    return texts.join(' ');
  }
}
