import 'dart:convert';

import 'package:haraj_clone/src/app/models/ad.model.dart';

class AdsListResponse {
  final List<Ad> ads;

  const AdsListResponse({
    this.ads,
  });

  Map<String, dynamic> toMap() {
    return {
      'ads': ads?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory AdsListResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AdsListResponse(
      ads: List<Ad>.from(map['ads']?.map((x) => Ad.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdsListResponse.fromJson(String source) =>
      AdsListResponse.fromMap(json.decode(source));
}
