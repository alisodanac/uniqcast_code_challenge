extension XmlDateTimeParser on String {
   DateTime get toDateTime {
    final regex = RegExp(r'(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2}) ([+-]\d{4})');
    final match = regex.firstMatch(this);

    if (match == null) {
      throw FormatException("Invalid EPG date format: $this");
    }

    int year = int.parse(match.group(1)!);
    int month = int.parse(match.group(2)!);
    int day = int.parse(match.group(3)!);
    int hour = int.parse(match.group(4)!);
    int minute = int.parse(match.group(5)!);
    int second = int.parse(match.group(6)!);
    String offsetString = match.group(7)!; // Timezone offset

    // Convert offset to Duration
    int offsetHours = int.parse(offsetString.substring(0, 3));
    int offsetMinutes = int.parse(offsetString.substring(0, 1) + offsetString.substring(3, 5));
    Duration offset = Duration(hours: offsetHours, minutes: offsetMinutes);

    // Create a DateTime object in UTC
    DateTime utcDateTime = DateTime.utc(year, month, day, hour, minute, second);

    // Adjust the time based on the offset
    return utcDateTime.subtract(offset);
  }
}

