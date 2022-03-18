import 'package:flutter/material.dart';

import '../data/api.dart';
import 'package:get/get.dart';

class OpenAiService {
  Api apiService = Api();
  getChat(String message) async {
    var result = await apiService.getChat(message);
    print(result);

    if (result == "error") {
      Get.snackbar("Error", "Some Error Occurred");
    } else {
      return result;
    }
  }
}
