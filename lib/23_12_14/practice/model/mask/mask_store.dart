class MaskStore {
  String? addr;
  String? code;
  String? createdAt;
  double? lat;
  double? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;

  MaskStore({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainStat,
    this.stockAt,
    this.type,
  });

  factory MaskStore.fromJson(Map<String, dynamic> json) {
    return MaskStore(
      addr: json['addr'] as String?,
      code: json['code'] as String?,
      createdAt: json['created_at'] as String?,
      lat: json['lat'].toDouble() as double?,
      lng: json['lng'].toDouble() as double?,
      name: json['name'] as String?,
      remainStat: json['remain_stat'] as String?,
      stockAt: json['stock_at'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'created_at': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remain_stat': remainStat,
      'stock_at': stockAt,
      'type': type,
    };
  }
}
