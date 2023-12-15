// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mask_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaskStore _$MaskStoreFromJson(Map<String, dynamic> json) => MaskStore(
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      remainStatus: json['remainStatus'] as String,
    );

Map<String, dynamic> _$MaskStoreToJson(MaskStore instance) => <String, dynamic>{
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'remainStatus': instance.remainStatus,
    };
