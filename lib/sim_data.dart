import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import './sim_model.dart';

export './sim_model.dart';

class SimDataPlugin {
  //defining channel to access sim data
  static const String channelName = "com.selftech.sim_data/channel_name";
  static const MethodChannel _channel = MethodChannel(channelName);
  static Future<SimData> getSimData() async {
    try {
      //getSimData method called using defined method channel
      dynamic simData = await _channel.invokeMethod('getSimData');
      var data = json.decode(simData);
      SimData simCards = SimData.fromJson(data);
      return simCards;
    } on PlatformException catch (e) {
      debugPrint('SimDataPlugin failed to retrieve data $e');
      rethrow;
    }
  }
}
