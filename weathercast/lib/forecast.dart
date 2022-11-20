import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYyNWM4ZmFmNzI3M2MwYjA0NTBlM2IxZWJmOTdmMzQ3ZWVhNThmYjBhMmEwMzFjY2E1MGIwZjY0NTNlNzczM2VhYmU1MzE5MTRlZjI2NWVjIn0.eyJhdWQiOiIyIiwianRpIjoiNjI1YzhmYWY3MjczYzBiMDQ1MGUzYjFlYmY5N2YzNDdlZWE1OGZiMGEyYTAzMWNjYTUwYjBmNjQ1M2U3NzMzZWFiZTUzMTkxNGVmMjY1ZWMiLCJpYXQiOjE2Njg5MzM0OTAsIm5iZiI6MTY2ODkzMzQ5MCwiZXhwIjoxNzAwNDY5NDkwLCJzdWIiOiIyMjgwIiwic2NvcGVzIjpbXX0.SFiEFjsDXartAKO3e2kq4XJfHYLVGhXYyFs_X99kqcrg6EpEOsg3qzXvaNJSBB6LRyK6hUfI-yOpoHp3KJmEyPVFH5M__SEsVB9EkupT_SUqnUs6GO8xOpaDAy1vT5CzfWMUDq87Ydh9lHLIcezi-v4T0C_1ruCxzJBhlXzVbW5JT2hSvhOtxuiMplyJczOn284a6gKmVsxAr91B1ck_0VjLYK38KLyLsBgcjFwgUQuPisa0RUSWIEjron2QwTK1rR9RtYKIe81BwMWCTKioiExteX1IR-spo-IBN5ncwEX16Z6RmWTP1WXrCCSO8ZbSvau-D88sTB_jfUbOhbGyHKZYgVZg0LedkUME69rBqWbckIJkMB8RINJCtkGtHBRBkPt-nzAPEyVAe81ELXflAFjD_9_iEqz4i9zKeoJUN-M436cXtzt0LC77kOGE2aBc0HJ2NMrzTwuZxOqpNsEqChlr-fiKEjzZU8sW94tM9JE-V9JqGUSzQEZc9cvPRn7BlHoAKrGeoqVHP68-N33juhlivwJbo5uRJkgapC3rqehncWYGb_UChPqKWD3dK8XwvKI7S2FMMxofLhXZFG6u_pHJnrd-Jk9c1WtntkL7B1Z1i2_UflnUsJPINd6cWlI-obmNLdSz-8D8iu4B7afo2DvwwGe_AEzyAXsHBAgRd0Q';

    try {
      Position location = await getCurrentLocation();
      http.Response response = await http.get(
      Uri.parse('$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'), 
      headers: {
      'accept': 'application/json',
      'authorization': 'Bearer $token',
    }
  );
  if(response.statusCode == 200) {
    var result = jsonDecode(response.body)['WeatherForecasts'][0]['forecasts'][0]['data'];
    Placemark address = (await placemarkFromCoordinates(location.latitude, location.longitude)).first;
    return Weather(
    address: '${address.subLocality}\n${address.administrativeArea}',
    temperature: result['tc'],
    cond: result['cond'],
  );
} else {
  return Future.error(response.statusCode);
}
  } catch (e) {
    return Future.error(e);
  }
}