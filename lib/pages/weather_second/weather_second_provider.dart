import 'package:asyncvalue_details/models/cities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_second_provider.g.dart';

@riverpod
class City extends _$City {
  @override
  Cities build() {
    print("[cityprovider initialized]");
    ref.onDispose(() {
      print("[cityprovider] disposed");
    });

    return Cities.seoul;
  }

  void changecity(Cities city) {
    state = city;
  }
}

@riverpod
FutureOr<String> weathersecound(WeathersecoundRef ref) async {
  print("[weathersecoundprovider] initialized");
  ref.onDispose(() {
    print("[weathersecoundprovider] disposed");
  });
  final city = ref.watch(cityProvider);
  await Future.delayed(const Duration(seconds: 1));
  switch (city) {
    case Cities.seoul:
      return "${city.name}-23";
    case Cities.london:
      return "failed to fetch the temperature of ${city.name}";
    case Cities.bangkok:
      return "failed to fetch the temperature of ${city.name}";
    case Cities.tokyo:
      return "${city.name}-23";
  }
}
