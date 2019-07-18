import 'package:flutter/material.dart';

TimeOfDay stringToTimeOfDay(String s){
  var splitted = s.split(" ");
  var amPm = splitted.last;
  var hourMinute = splitted[0];
  var hour = int.parse(hourMinute.split(":")[0].trim());
  var minute = int.parse(hourMinute.split(":")[1].trim());
  return TimeOfDay(
      hour:  hour +
          (amPm.toLowerCase().contains("pm") && hour != 12 ? 12 : 0),
      minute: minute);
}