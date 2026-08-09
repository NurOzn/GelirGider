class AppUser {
    final String? id;
    final String? email;
    final String? firstName;
    final String? lastName;
    final String? profilePhoto;

    AppUser({this.id, this.email, this.firstName, this.lastName, this.profilePhoto});

    factory AppUser.fromJson(Map<String, dynamic> json)=> AppUser(
        id : json["id"],
        email : json["email"],
        firstName :json["first_name"],
        lastName : json["last_name"],
        profilePhoto : json["profile_photo"],
    );

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["email"] = email;
        _data["first_name"] = firstName;
        _data["last_name"] = lastName;
        _data["profile_photo"] = profilePhoto;
        return _data;
    }
}
