import 'package:asyncvalue_details/extensions/async_value_xx.dart';
import 'package:asyncvalue_details/models/cities.dart';
import 'package:asyncvalue_details/pages/weather_first/weather_first_provider.dart';
import 'package:asyncvalue_details/pages/weather_second/weather_second_provider.dart';
 // Assuming correct path
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int _selectedCityIndex = 1;

class WeathersecoundPage extends ConsumerWidget {
  const WeathersecoundPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<String>>(weathersecoundProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(next.error.toString()),
          ),
        );
      }
    });

    final weather = ref.watch(weatherFirstProvider);
    print(weather.toStr);
    print(weather.props);

    print('value: ${weather.value}'); // Access value within data case
    print('valueOrNull:${weather.valueOrNull}');

    // Handle potential null case using valueOrNull
    if (weather.valueOrNull != null) {
      print('requireValue:${weather.valueOrNull}'); // Use valueOrNull if available
    } else {
      print('StateError: value not available'); // Handle missing value
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncValue Details - First'),
      ),
      body: Center(
        child: weather.when(
          skipError: true,
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
               const GetWeatherButton()
            ],
          ),
          error: (e, st) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                e.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const GetWeatherButton()
            ],
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class GetWeatherButton extends ConsumerWidget {
  const GetWeatherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: () {
        final cityIndex = _selectedCityIndex % Cities.values.length; // Modulo to handle overflow
        final city = Cities.values[cityIndex];

        // Handle potential null case with null check
        ref.read(weatherFirstProvider.notifier).getTemperature(city);
        _selectedCityIndex++;
            },
      child: const Text('Get Weather'),
    );
  }
}
