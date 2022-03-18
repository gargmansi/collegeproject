import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class OpenAI {
  Future<String> answer(
    String question, {
    String examplesContext = "Health assistat",
    String searchModel = 'davinci',
    String model = 'davinci',
  }) async {
    Map reqData = {
      "question": question,
      "max_tokens": 100,
      "stop": ["\n"],
      'examples': [
        [
          "What should i eat in fever?",
          "You should eat light, easily-digestible foods like soup, toast, or crackers. Avoid dairy and greasy foods."
        ]
      ],
      'documents': [],
      'examples_context': examplesContext,
      'search_model': searchModel,
      'model': model,
    };

    var response = await http
        .post(
          Uri.parse('https://api.openai.com/v1/answers'),
          headers: {
            HttpHeaders.authorizationHeader:
                "Bearer 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",
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonEncode(reqData),
        )
        .timeout(const Duration(seconds: 120));

    Map<String, dynamic> map = json.decode(response.body);
    print(map);
    List<dynamic> resp = map["answers"];
    return resp[0];
  }
}
