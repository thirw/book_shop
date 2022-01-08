// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderByID _$OrderByIDFromJson(Map<String, dynamic> json) => OrderByID(
      json['order_id'] as int,
      json['status'] as String,
      json['member_id'] as int,
      (json['books'] as List<dynamic>)
          .map((e) => BookOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderByIDToJson(OrderByID instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'status': instance.status,
      'member_id': instance.memberId,
      'books': instance.books,
    };
