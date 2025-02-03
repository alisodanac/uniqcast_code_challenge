import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:uniqcast_code_challenge/core/errors/exception/exceptions.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/channel/channel_model.dart';


abstract class ChannelsLocalDatasource {
  /// [saveChannels] (List channelsList):
  /// Saves a list of channels to the local data source. 
  /// Returns a Future that completes when the save operation is done.
  Future<void> saveChannels(List<ChannelModel> channelsList);
/// [retrieveChannels()] : Retrieves a list of channels from the local data source
///  Returns a Future that completes with the list of channels, or throws an exception if the data source is empty.
  Future<List<ChannelModel>> retrieveChannels();
}

@Singleton(as: ChannelsLocalDatasource)
class ChannelsLocalDatasourceImp implements ChannelsLocalDatasource {
  HiveInterface hive;
  ChannelsLocalDatasourceImp({required this.hive});
  @override
  Future<void> saveChannels(List<ChannelModel> channelsList) async {
    var box = await Hive.openBox<ChannelModel>('channels');

    await box.addAll(channelsList);
  }

  @override
  Future<List<ChannelModel>> retrieveChannels() async {
    var box = await Hive.openBox<ChannelModel>('channels');
   final values = box.values.toList();
   if(values.isEmpty){
    throw EmptyCacheException();
   }else{
    return values;
   }
  }
}
