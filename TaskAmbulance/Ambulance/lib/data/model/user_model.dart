class UserModel {
  final int userid;
  final String? email;
  final String? cnicnumber;
  final String? fullName;
  final String? phone;
  final String? password;
  final String? address;
  final String? cityaddress;
  final String? cnicImage;

  UserModel({
    required this.userid,
    required this.email,
    required this.cnicnumber,
    required this.fullName,
    required this.phone,
    required this.password,
    required this.address,
    required this.cityaddress,
    required this.cnicImage,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) => UserModel(
      userid: json['user_id'],
      email: json['email'],
      cnicnumber: json['cnic_number'],
      fullName: json['full_name'],
      phone: json['phone'],
      password: json['password'],
      address: json['address'],
      cityaddress: json['city_address'],
      cnicImage: json['cnic_image']);
}
