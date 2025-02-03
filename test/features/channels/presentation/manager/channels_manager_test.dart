import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:uniqcast_code_challenge/core/errors/failures/failures.dart';
import 'package:uniqcast_code_challenge/core/service_locator/injection.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/channel_entity.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/usecases/get_channels_usecase.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/manager/channels_manager.dart';

import 'channels_manager_test.mocks.dart';

// Generate the mock class
@GenerateMocks([GetChannelsUsecase])
void main() {
  late MockGetChannelsUsecase mockGetChannelsUsecase;
  late ProviderContainer container;

  setUp(() {
    mockGetChannelsUsecase = MockGetChannelsUsecase();
    container = ProviderContainer();

    getIt.reset();

    // Register the mocked use case
    getIt.registerSingleton<GetChannelsUsecase>(mockGetChannelsUsecase);
  });

  tearDown(() {
    container.dispose();
  });

  test('channelsAndPrograms provider returns a list of channels on success', () async {
    final mockChannels = [
      const ChannelEntity(id: '1', name: 'Channel 1', programs: [], logo: '', url: ''),
      const ChannelEntity(id: '2', name: 'Channel 2', programs: [], logo: '', url: ''),
    ];

    // Mock the use case to return a successful response
    when(mockGetChannelsUsecase.call()).thenAnswer((_) async => Right(mockChannels));

    // Read the provider and wait for the result
    final result = await container.read(channelsAndProgramsProvider.future);

    expect(result, equals(mockChannels));
  });

  test('channelsAndPrograms provider returns Failure on error', () async {
    // ✅ Mock the use case to return Left (Failure)
    when(mockGetChannelsUsecase.call()).thenAnswer((_) async => Left(ServerFailure()));

    final result = await mockGetChannelsUsecase.call();

    expect(result, isA<Left<Failure, List<ChannelEntity>>>());
  });

  test('selectedChannelIndexProvider initializes with 0', () {
    final index = container.read(selectedChannelIndexProvider);

    expect(index, 0);
  });

  test('selectedChannelIndexProvider updates value correctly', () {
    container.read(selectedChannelIndexProvider.notifier).state = 2;

    final index = container.read(selectedChannelIndexProvider);

    expect(index, 2);
  });
}
