class Ambulancebooking {
  final int? bookinId;
  final String? bookingType;
  final String? quantity;
  final String? statusImage;
  final String? location;
  final int? userId;
  final String? dateofbook;
  final String? bookingStatus;
  final String? fullname;
  final String? phone;

  Ambulancebooking({
    required this.bookinId,
    required this.bookingType,
    required this.quantity,
    required this.statusImage,
    required this.location,
    required this.userId,
    required this.dateofbook,
    required this.bookingStatus,
    required this.fullname,
    required this.phone,
  });

  factory Ambulancebooking.fromjson(Map<String, dynamic> json) =>
      Ambulancebooking(
        bookinId: json['booking_id'],
        bookingType: json['booking_type'],
        quantity: json['quantity'],
        statusImage: json['status_image'],
        location: json['location'],
        userId: json['user_id'],
        dateofbook: json['dateofbook'],
        bookingStatus: json['booking_status'],
        fullname: json['full_name'],
        phone: json['phone'],
      );
}
