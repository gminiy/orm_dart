import 'package:json_annotation/json_annotation.dart';

part 'mask_store.g.dart';

@JsonSerializable(explicitToJson: true)
class MaskStore {
  String address;
  double lat;
  double lng;
  String name;
  String remainStatus;

  MaskStore({
    required this.address,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStatus,
  });

  factory MaskStore.fromJson(Map<String, dynamic> json) =>
      _$MaskStoreFromJson(json);

  Map<String, dynamic> toJson() => _$MaskStoreToJson(this);

  @override
  String toString() {
    return 'MaskStore{address: $address, lat: $lat, lng: $lng, name: $name, remainStatus: $remainStatus}';
  }
}
