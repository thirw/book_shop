import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  final int id;
  final String title;

  // final String description;
  final double price;

  // final String imageUrl;
  // final String userId;

  Book(
    this.id,
    this.title,
    // this.description,
    this.price,
    // this.imageUrl,
    // this.userId,
  );

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson(instance) => _$BookToJson(this);
}

@JsonSerializable()
class BookOrderItem {
  final int quantity, id;
  final String title;
  final double price, total;

  BookOrderItem(
    this.quantity,
    this.id,
    this.title,
    this.price,
    this.total,
  );

  factory BookOrderItem.fromJson(Map<String, dynamic> json) =>
      _$BookOrderItemFromJson(json);

  Map<String, dynamic> toJson(instance) => _$BookOrderItemToJson(this);
}
