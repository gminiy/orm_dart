import 'dart:convert';
import 'package:http/http.dart' as http;
import './model/mask/mask_response.dart';

class MaskClient {
  Future<MaskResponse> getMask() async {
    final response =
        await http.get(Uri.parse('http://104.198.248.76:3000/mask'));

    return MaskResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
