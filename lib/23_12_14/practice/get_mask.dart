import 'package:orm_dart/23_12_14/practice/model/mask/mask_response.dart';
import './mask_client.dart';

void main() async {
  final MaskClient maskClient = MaskClient();
  final MaskResponse maskResponse = await maskClient.getMask();

  print(maskResponse.toJson());
}