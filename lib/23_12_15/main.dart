import 'package:orm_dart/23_12_15/mapper/mask_mapper.dart';
import './source/mask_api.dart';
import 'package:orm_dart/23_12_15/dto/mask_dto.dart';
import 'model/mask_store.dart';

void main() async {
  final MaskApi maskClient = MaskApi();

  final MaskDto maskDto = await maskClient.getMask();

  final List<MaskStore> maskStores =
      maskDto.stores?.map((e) => e.toMaskStore()).toList() ?? [];

  print(maskStores);
}
