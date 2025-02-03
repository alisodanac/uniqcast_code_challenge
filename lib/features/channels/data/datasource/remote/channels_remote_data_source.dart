import 'dart:convert';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:uniqcast_code_challenge/core/configurations/network_configurations.dart';
import 'package:uniqcast_code_challenge/core/errors/exception/exceptions.dart';
import 'package:uniqcast_code_challenge/features/channels/data/datasource/remote/xml_parser.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/channel/channel_model.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/program/program_model.dart';
import 'package:xml/xml_events.dart';


  /// Fetches the Electronic Program Guide (EPG) channels from a remote XML source,
  /// parses them using a streaming XML parser, and returns a list of [ChannelModel] objects.
  ///
  /// This method performs the following steps:
  /// 1. Initializes an empty list of channels and a map to associate channel IDs with their programs.
  /// 2. Sends an HTTP GET request to retrieve the XML data.
  /// 3. If the response status is 200, processes the XML data using an event-based parser.
  /// 4. Populates the list of channels and associates them with their corresponding programs.
  /// 5. Returns the final list of channels with programs.
  ///
  /// Throws a [ServerException] if the HTTP request fails.
  ///
  /// Returns a [Future] that resolves to a list of [ChannelModel] objects with their associated programs.

abstract class ChannelsRemoteDataSource {
  Future<List<ChannelModel>> fetchEpgChannels();
}

@Singleton(as: ChannelsRemoteDataSource)
class ChannelsRemoteDataSourceImp implements ChannelsRemoteDataSource {
  ChannelsRemoteDataSourceImp({required this.xmlEpgParser, required this.httpClient});

  final XmlEpgParser xmlEpgParser;
  final HttpClient httpClient;

  @override
  Future<List<ChannelModel>> fetchEpgChannels() async {
    List<ChannelModel> channels = [];
    Map<String, List<ProgramModel>> programsMap = {};
    final state = XmlParsingState();
    final url = Uri.parse(NetworkConfigurations.channelsUrl);
    final request = await httpClient.getUrl(url);
    final response = await request.close();
    if (response.statusCode == 200) {
      await response.transform(utf8.decoder).toXmlEvents().normalizeEvents().forEachEvent(
            onStartElement: (event) => xmlEpgParser.handleStartElement(event, state),
            onText: (event) => xmlEpgParser.handleText(event, state),
            onEndElement: (event) => xmlEpgParser.handleEndElement(event, channels, programsMap, state),
          );
      final channelsWithProgram = channels.map((e) => e.copyWith(programs: programsMap[e.id] ?? [])).toList();

      return channelsWithProgram;
    } else {
      throw ServerException();
    }
  }
}
