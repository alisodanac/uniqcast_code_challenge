import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/channel_entity.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/program_entity.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/repository/channels_repository.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/usecases/get_channels_usecase.dart';
import 'package:mockito/annotations.dart';

import 'get_channels_usecase_test.mocks.dart'; 

@GenerateMocks([ChannelsRepository], customMocks: [MockSpec<ChannelsRepository>(as: #MyMockChannelsRepository)])
void main() {
  late GetChannelsUsecase getChannelsUsecase;
  late MockChannelsRepository mockChannelsRepository;

  setUp(() {
    mockChannelsRepository = MockChannelsRepository();
    getChannelsUsecase = GetChannelsUsecase(mockChannelsRepository);
  });

  List<ChannelEntity> channels = [
    ChannelEntity(
      id: '1',
      name: 'channel 1',
      logo: "https://cdn-0.tvprofil.com/cdn/400x200/4/img/kanali-logo/HBO_logo.png",
      url: "http://www.hbo.hr",
      programs: [
        ProgramEntity(
          channelId: "1",
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          title: 'Program 1',
          description: 'Description about program 1',
        ),
      ],
    ),
  ];

  test('should get a list of channels entity from the repository', () async {

    when(mockChannelsRepository.getChannels()).thenAnswer((_) async => Right(channels));

    final result = await getChannelsUsecase();


    expect(result, Right(channels));


    verify(mockChannelsRepository.getChannels()).called(1);
    verifyNoMoreInteractions(mockChannelsRepository);
  });
}
