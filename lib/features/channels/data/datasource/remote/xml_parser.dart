import 'package:uniqcast_code_challenge/core/extensions/egp_datetime_converter.dart';
import 'package:uniqcast_code_challenge/features/channels/data/datasource/remote/xml_parser_keys.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/channel/channel_model.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/program/program_model.dart';
import 'package:xml/xml_events.dart';
/// A parser for handling XML-based Electronic Program Guide (EPG) data.
///
/// This class processes XML events from an EPG data source and converts them
/// into structured [ChannelModel] and [ProgramModel] objects.
class XmlEpgParser {
   /// Handles the start of an XML element during parsing.
  ///
  /// This method extracts relevant attributes and updates the [XmlParsingState].
  ///
  /// - `event`: The XML start element event.
  /// - `state`: The current parsing state.

  void handleStartElement(XmlStartElementEvent event, XmlParsingState state) {
    switch (event.name) {
      case XmlParserKeys.channel:
        state.currentChannelId = event.attributes
            .firstWhere(
              (attr) => attr.name == 'id',
              orElse: () => XmlEventAttribute('id', '', XmlAttributeType.SINGLE_QUOTE),
            )
            .value;
        break;

      case XmlParserKeys.displayName:
      case XmlParserKeys.url:
        state.isParsingTitle = true;
        break;

      case XmlParserKeys.icon:
        state.currentChannelLogo = event.attributes
            .firstWhere(
              (attr) => attr.name == XmlParserKeys.src,
              orElse: () => XmlEventAttribute('src', '', XmlAttributeType.SINGLE_QUOTE),
            )
            .value;
        break;

      case XmlParserKeys.program:
        final programChannelId = event.attributes
            .firstWhere(
              (attr) => attr.name == XmlParserKeys.channel,
              orElse: () => XmlEventAttribute('channel', '', XmlAttributeType.SINGLE_QUOTE),
            )
            .value;

        state.currentStartTime = event.attributes
            .firstWhere(
              (attr) => attr.name == XmlParserKeys.startTime,
              orElse: () => XmlEventAttribute('start', '', XmlAttributeType.SINGLE_QUOTE),
            )
            .value
            .toDateTime;

        state.currentEndTime = event.attributes
            .firstWhere(
              (attr) => attr.name == XmlParserKeys.endTime,
              orElse: () => XmlEventAttribute('stop', '', XmlAttributeType.SINGLE_QUOTE),
            )
            .value
            .toDateTime;
        state.currentChannelId = programChannelId;
        break;

      case XmlParserKeys.title:
        state.isParsingTitle = true;
        break;

      case XmlParserKeys.description:
        state.isParsingTitle = false;
        state.isParsingDesc = true;
        break;
    }
  }

/// Handles the text content within an XML element.
  ///
  /// This method processes text nodes and assigns them to the appropriate
  /// fields in the [XmlParsingState].
  ///
  /// - `event`: The XML text event.
  /// - `state`: The current parsing state.
  void handleText(XmlTextEvent event, XmlParsingState state) {
    final trimmedText = event.text.trim();
    if (trimmedText.isNotEmpty) {
      if (state.isParsingTitle) {
        if (state.currentChannelId != null && state.currentChannelName == null) {
          state.currentChannelName = trimmedText;
        } else {
          state.currentTitle = trimmedText;
        }
      } else if (state.isParsingDesc) {
        state.currentDescription = trimmedText;
      }
    }
  }
/// Handles the end of an XML element and finalizes data extraction.
  ///
  /// This method creates [ChannelModel] and [ProgramModel] instances when
  /// an element is fully parsed.
  ///
  /// - `event`: The XML end element event.
  /// - `channels`: A list to store parsed [ChannelModel] objects.
  /// - `programsMap`: A map associating channel IDs with their programs.
  /// - `state`: The current parsing state.
  void handleEndElement(
    XmlEndElementEvent event,
    List<ChannelModel> channels,
    Map<String, List<ProgramModel>> programsMap,
    XmlParsingState state,
  ) {
    switch (event.name) {
      case XmlParserKeys.displayName:
        state.isParsingTitle = false;
        break;

      case XmlParserKeys.url:
        state.isParsingTitle = false;
        state.currentChannelUrl = state.currentChannelName;
        break;

      case XmlParserKeys.channel:
        if (state.currentChannelId != null && state.currentChannelName != null && state.currentChannelLogo != null && state.currentChannelUrl != null) {
          channels.add(ChannelModel(
            id: state.currentChannelId!,
            name: state.currentChannelName!,
            logo: state.currentChannelLogo!,
            url: state.currentChannelUrl!,
          ));
        }

        // Reset channel state
        state.currentChannelId = null;
        state.currentChannelName = null;
        state.currentChannelLogo = null;
        state.currentChannelUrl = null;
        break;

      case XmlParserKeys.program:
        if (state.currentChannelId != null &&
            state.currentStartTime != null &&
            state.currentEndTime != null &&
            state.currentTitle != null &&
            state.currentDescription != null) {
          final program = ProgramModel(
            channelId: state.currentChannelId!,
            startTime: state.currentStartTime!,
            endTime: state.currentEndTime!,
            title: state.currentTitle!,
            description: state.currentDescription!,
          );

          programsMap.putIfAbsent(state.currentChannelId!, () => []).add(program);
        }

        // Reset program state
        state.currentTitle = null;
        state.currentDescription = null;
        state.currentStartTime = null;
        state.currentEndTime = null;
        break;
    }
  }
}


// Maintains the current state during XML parsing.
///
/// This class stores temporary values while parsing XML elements
/// and helps in constructing [ChannelModel] and [ProgramModel] objects.
class XmlParsingState {
   /// The ID of the channel currently being parsed.
  String? currentChannelId;

  /// The name of the channel currently being parsed.
  String? currentChannelName;

  /// The logo URL of the channel currently being parsed.
  String? currentChannelLogo;

  /// The website URL of the channel currently being parsed.
  String? currentChannelUrl;

  /// The title of the program currently being parsed.
  String? currentTitle;

  /// The description of the program currently being parsed.
  String? currentDescription;

  /// The start time of the program currently being parsed.
  DateTime? currentStartTime;

  /// The end time of the program currently being parsed.
  DateTime? currentEndTime;

  /// A flag indicating whether the parser is currently reading a title.
  bool isParsingTitle = false;

  /// A flag indicating whether the parser is currently reading a description.
  bool isParsingDesc = false;
}
