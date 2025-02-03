
import 'package:test/test.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/program/program_model.dart';

void main() {
  
    test('can Instantiate', () {
      const channelId = '1';
      final DateTime startTime = DateTime.now();
      final DateTime endTime = DateTime.now().add(const Duration(hours: 1));
      const title = 'Test Program';
      const description = 'Test Description';
      
      final programModel = ProgramModel(
        channelId: channelId,
        startTime: startTime,
        endTime: endTime,
        title: title,
        description: description,
      );

      expect(programModel, isNotNull);
      expect(programModel.channelId, isNotNull);
      expect(programModel.startTime, isNotNull);
      expect(programModel.endTime, isNotNull);
      expect(programModel.title, isNotNull);
      expect(programModel.description, isNotNull);
      expect(programModel.channelId, equals(channelId));
      expect(programModel.startTime, equals(startTime));
      expect(programModel.endTime, equals(endTime));
      expect(programModel.title, equals(title));
      expect(programModel.description, equals(description));
    });
    


}
