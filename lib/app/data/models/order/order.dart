import 'package:book_shop/app/data/models/book/book.dart';
import 'package:book_shop/app/data/models/cart/cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderByID {
  @JsonKey(name: 'order_id' )
  final int orderId;

  final String status;

  @JsonKey(name: 'member_id')
  final int memberId;


  final List<BookOrderItem> books;

  OrderByID(
    this.orderId,
    this.status,
    this.memberId,
    this.books,
  );

  factory OrderByID.fromJson(Map<String, dynamic> json) =>
      _$OrderByIDFromJson(json);

  Map<String, dynamic> toJson(instance) => _$OrderByIDToJson(this);
}


