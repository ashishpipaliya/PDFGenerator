import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String firstName;
  String lastname;
  String email;
  String password;
  String image;
  String phoneNumber;
  String city;
  String state;
  String zip;
  String country;
  String deviceId;
  String deviceType;
  String createdAt;

  UserModel(
      {this.uid,
      this.firstName,
      this.lastname,
      this.email,
      this.password,
      this.image,
      this.phoneNumber,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.deviceId,
      this.deviceType,
      this.createdAt});

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
      uid: doc.id,
      firstName: data['first_name'],
      lastname: data['last_name'],
      email: data['email'],
      // password: data['password'],
      image: data['image'],
      city: data['city'],
      state: data['state'],
      zip: data['zip'],
      country: data['country'],
      phoneNumber: data['phone'],
      deviceId: data['device_id'],
      deviceType: data['device_type'],
      createdAt: data['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'first_name': firstName,
      'last_name': lastname,
      'email': email,
      'image': image,
      'city': city,
      'state': state,
      'zip': zip,
      'country': country,
      'phone': phoneNumber,
      'device_id': deviceId,
      'device_type': deviceType,
      'created_at': createdAt,
    };
  }
}
