import 'dart:async';

import 'package:http/http.dart';

class Network {
  final String url;

  Network(this.url);

  Future<String> getData() async {
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 404) {
      return 'Not found';
    } else if (response.statusCode == 500) {
      return 'Server not responding';
    }
    return 'Network error';
  }
}

Future<String> getNetworkDataForHotel() async {
  // final network = Network('https://run.mocky.io/v3/43542dc7-f279-413a-b2eb-b6c5db7f2c4d');
  final network = Network('https://run.mocky.io/v3/75000507-da9a-43f8-a618-df698ea7176d');
  final networkData = await network.getData();
  return networkData;
}

Future<String> getNetworkDataForRoom() async {
  // final network = Network('https://run.mocky.io/v3/524a57ad-f734-4a82-a760-3f1ef76c8e87');
  final network = Network('https://run.mocky.io/v3/85db21b4-32a7-4032-bb80-694bb596a445');
  final networkData = await network.getData();
  return networkData;
}

Future<String> getNetworkDataFromReservation() async {
  // final network = Network('https://run.mocky.io/v3/96cf7c34-472a-47e1-acca-2c4f007b48be');
  final network = Network('https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');
  final networkData = await network.getData();
  return networkData;
}
