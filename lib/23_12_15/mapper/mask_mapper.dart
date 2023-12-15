import '../dto/mask_dto.dart';
import '../model/mask_store.dart';

extension ToMask on Store {
  MaskStore toMaskStore() {
    return MaskStore(
      address: addr ?? '',
      lat: lat ?? 0.0,
      lng: lng ?? 0.0,
      name: name ?? '이름 없음',
      remainStatus: remainStat ?? '알 수 없음',
    );
  }
}
