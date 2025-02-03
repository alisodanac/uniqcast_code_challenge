import 'package:uniqcast_code_challenge/features/channels/data/models/channel/channel_model.dart';
 
import 'package:test/test.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/program/program_model.dart';

void main(){
  group('ChannelModel', (){
    test('can Instantiate', (){
      const channelId = '1';
      const name = 'test channel';
      const logo = 'test logo';
      const url = 'test url';
      const List<ProgramModel> programs =[];
      final channelModel = ChannelModel(
        id: channelId,
        name: name,
        logo: logo,
        url: url,
        programs: programs,
      );
      expect(channelModel, isNotNull);
      expect(channelModel.id  , isNotNull);
      expect(channelModel.logo, isNotNull);
      expect(channelModel.name, isNotNull); 
      expect(channelModel.url  , isNotNull  );
      expect(channelModel.programs,isEmpty);
      expect(channelModel.id, equals(channelId));
      expect(channelModel.name, equals(name));
      expect(channelModel.logo, equals(logo));
      expect(channelModel.url, equals(url));
      expect(channelModel.programs, equals(programs)) ;
    });
    test('can Instantiate from json', (){
      const json = {'id': '1', 'name': 'test channel', 'logo': 'test logo', 'url': 'test url', };
    
      final channelModel = ChannelModel.fromJson(json);
      expect(channelModel, isNotNull);
      expect(channelModel.id  , isNotNull);
      expect(channelModel.logo, isNotNull);
      expect(channelModel.name, isNotNull); 
      expect(channelModel.url  , isNotNull);
      expect(channelModel.programs,isEmpty);
      expect(channelModel.id, equals(json['id']));
      expect(channelModel.name, equals(json["name"]));
      expect(channelModel.logo, equals(json['logo']));
      expect(channelModel.url, equals(json['url']));
      expect(channelModel.programs, isEmpty) ;
    });
  });
}