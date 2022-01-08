// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['id'] as int,
      json['title'] as String,
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
    };

BookOrderItem _$BookOrderItemFromJson(Map<String, dynamic> json) =>
    BookOrderItem(
      json['quantity'] as int,
      json['id'] as int,
      json['title'] as String,
      (json['price'] as num).toDouble(),
      (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$BookOrderItemToJson(BookOrderItem instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'total': instance.total,
    };
