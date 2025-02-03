import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get toHours{
   final dateTimeToLocal = toLocal();
   final formatter = DateFormat('HH:mm');
   return formatter.format(dateTimeToLocal);
  }

  String get toDates{
    final dateTimeToLocal = toLocal();
    if(dateTimeToLocal.day == DateTime.now().day){
      return 'Today';
    }else if(dateTimeToLocal.day == DateTime.now().day + 1){
      return 'Tomorrow';
    }else if(dateTimeToLocal.day == DateTime.now().day - 1){
      return 'Yesterday';
    }else{
    final formatter = DateFormat('dd/MM/yyyy');

    return formatter.format(dateTimeToLocal);
    }
  }
}