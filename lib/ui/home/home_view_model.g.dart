// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeViewModelHash() => r'c1c863bdf81b3b7b7c1e6c8517839ce8d34a6fc3';

/// See also [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider =
    AutoDisposeAsyncNotifierProvider<HomeViewModel, List<CheckItem>>.internal(
  HomeViewModel.new,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewModel = AutoDisposeAsyncNotifier<List<CheckItem>>;
String _$listeningStateHash() => r'55cf4c444249beccb6533f25d7a3008d3a7056dc';

/// See also [ListeningState].
@ProviderFor(ListeningState)
final listeningStateProvider =
    AutoDisposeNotifierProvider<ListeningState, bool>.internal(
  ListeningState.new,
  name: r'listeningStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listeningStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListeningState = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
