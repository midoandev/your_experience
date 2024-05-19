import 'dart:convert';

class MainProfile {
  Iam buttonIam;
  String descriptionIam;
  String hiIam;
  String iam;
  Iam imageIam;

  MainProfile({
    required this.buttonIam,
    required this.descriptionIam,
    required this.hiIam,
    required this.iam,
    required this.imageIam,
  });

  factory MainProfile.fromRawJson(String str) =>
      MainProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainProfile.fromJson(Map<String, dynamic> json) => MainProfile(
        buttonIam: Iam.fromJson(json["button_iam"]),
        descriptionIam: json["description_iam"],
        hiIam: json["hi_iam"],
        iam: json["iam"],
        imageIam: Iam.fromJson(json["image_iam"]),
      );

  factory MainProfile.empty() => MainProfile(
        buttonIam: Iam.empty(),
        hiIam: '',
        descriptionIam: '',
        iam: '',
        imageIam: Iam.empty(),
      );

  Map<String, dynamic> toJson() => {
        "button_iam": buttonIam.toJson(),
        "description_iam": descriptionIam,
        "hi_iam": hiIam,
        "iam": iam,
        "image_iam": imageIam.toJson(),
      };
}

class Iam {
  String text;
  String url;

  Iam({
    required this.text,
    required this.url,
  });

  factory Iam.fromRawJson(String str) => Iam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Iam.fromJson(Map<String, dynamic> json) => Iam(
        text: json["text"],
        url: json["url"],
      );

  factory Iam.empty() => Iam(
        text: '',
        url: '',
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "url": url,
      };
}
