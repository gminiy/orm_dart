import 'mask_store.dart';

class MaskResponse {
  int? count;
  List<MaskStore>? stores;

  MaskResponse({this.count, this.stores});

  factory MaskResponse.fromJson(Map<String, dynamic> json) {
    var list = json['stores'] as List;
    List<MaskStore>? storesList =
        list.map((i) => MaskStore.fromJson(i)).toList();

    return MaskResponse(
      count: json['count'] as int?,
      stores: storesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'stores': stores?.map((store) => store.toJson()).toList(),
    };
  }
}
