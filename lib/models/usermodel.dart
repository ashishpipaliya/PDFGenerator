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
  String deviceType;
  Timestamp createdAtServer;
  Timestamp createdAtClient;

  UserModel({
    this.uid,
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
    this.deviceType,
    this.createdAtServer,
    this.createdAtClient,
  });

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
      deviceType: data['device_type'],
      createdAtServer: data['created_at_server'],
      createdAtClient: data['created_at_client'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return new UserModel(
        firstName: data['first_name'],
        lastname: data['last_name'],
        email: data['email'],
        image: data['image'],
        city: data['city'],
        state: data['state'],
        zip: data['zip'],
        country: data['country'],
        phoneNumber: data['phone'],
        deviceType: data['device_type'],
        createdAtServer: data['created_at_server'],
        createdAtClient: data['created_at_client']);
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
      'device_type': deviceType,
      'created_at_server': createdAtServer,
      'created_at_client': createdAtClient,
    };
  }
}
