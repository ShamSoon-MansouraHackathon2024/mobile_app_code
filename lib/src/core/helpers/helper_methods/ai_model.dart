import 'dart:developer';

import 'package:tflite_flutter/tflite_flutter.dart';

class AiModel{
  late Interpreter _interpreter;

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('models/solar_panel_model.tflite');
    log('Model loaded successfully!');
  }
}