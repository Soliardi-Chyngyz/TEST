class AuthResponse {
  String? accessToken;
  String? refreshToken;
  int? accessTokenExpiration;
  int? refreshTokenExpiration;
  User? user;

  AuthResponse(
      {this.accessToken,
        this.refreshToken,
        this.accessTokenExpiration,
        this.refreshTokenExpiration,
        this.user});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    accessTokenExpiration = json['accessTokenExpiration'];
    refreshTokenExpiration = json['refreshTokenExpiration'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['accessTokenExpiration'] = accessTokenExpiration;
    data['refreshTokenExpiration'] = refreshTokenExpiration;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? imageUrl;
  String? documentUrl;
  String? gender;
  String? street;
  String? zipCode;
  String? city;
  String? country;
  String? bonuses;
  String? fcmToken;
  String? birthdate;

  User(
      {this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.imageUrl,
        this.documentUrl,
        this.gender,
        this.street,
        this.zipCode,
        this.city,
        this.country,
        this.bonuses,
        this.fcmToken,
        this.birthdate});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
    documentUrl = json['documentUrl'];
    gender = json['gender'];
    street = json['street'];
    zipCode = json['zipCode'];
    city = json['city'];
    country = json['country'];
    bonuses = json['bonuses'];
    fcmToken = json['fcmToken'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['imageUrl'] = imageUrl;
    data['documentUrl'] = documentUrl;
    data['gender'] = gender;
    data['street'] = street;
    data['zipCode'] = zipCode;
    data['city'] = city;
    data['country'] = country;
    data['bonuses'] = bonuses;
    data['fcmToken'] = fcmToken;
    data['birthdate'] = birthdate;
    return data;
  }
}