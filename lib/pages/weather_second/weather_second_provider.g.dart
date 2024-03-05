// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_second_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weathersecoundHash() => r'c16acd30e9835179a670ad6bd48a2555877e5c8e';

/// See also [weathersecound].
@ProviderFor(weathersecound)
final weathersecoundProvider = AutoDisposeFutureProvider<String>.internal(
  weathersecound,
  name: r'weathersecoundProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weathersecoundHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeathersecoundRef = AutoDisposeFutureProviderRef<String>;
String _$cityHash() => r'e92a0f6aafe691371dceac396bfebf44e63051dc';

/// See also [City].
@ProviderFor(City)
final cityProvider = AutoDisposeNotifierProvider<City, Cities>.internal(
  City.new,
  name: r'cityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$City = AutoDisposeNotifier<Cities>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
