import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gpt_3_dart/gpt_3_dart.dart';
import 'package:http/http.dart' as http;

String mes = "This is a conversation between doctor and a patient";

class Api {
  getChat(String message) async {
    try {
      OpenAI openAI =
          OpenAI(apiKey: "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");
      String complete =
          await openAI.complete(mes, 10, engine: "text-davinci-002");
      log(complete);
      return complete;
    } catch (e) {
      log(e.toString());
      return "error";
    }
  }
}
