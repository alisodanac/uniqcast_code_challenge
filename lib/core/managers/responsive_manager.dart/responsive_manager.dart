import 'dart:math';

import 'package:flutter/material.dart';

extension ResponsiveManager on num{
 double  h (BuildContext context){
  return MediaQuery.of(context).size.height * this;
 }

 double  w (BuildContext context){
  return MediaQuery.of(context).size.width * this;
 }
 
  }

  class ScaleSize {
    static TextScaler textScaler(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    double scaleFactor = max(1, min(val, maxTextScaleFactor));
    return TextScaler.linear(scaleFactor);
  }
}
