import 'dart:convert';

class MainProfile {
  final Iam buttonIam;
  final String descriptionIam;
  final String hiIam;
  final String iam;
  final Iam imageIam;

  const MainProfile({
    required this.buttonIam,
    required this.descriptionIam,
    required this.hiIam,
    required this.iam,
    required this.imageIam,
  });

  factory MainProfile.fromJson(Map<String, dynamic> json) => MainProfile(
    buttonIam: Iam.fromJson(json['button_iam']),
    descriptionIam: json['description_iam'] as String,
    hiIam: json['hi_iam'] as String,
    iam: json['iam'] as String,
    imageIam: Iam.fromJson(json['image_iam']),
  );

  Map<String, dynamic> toJson() => {
    'button_iam': buttonIam.toJson(),
    'description_iam': descriptionIam,
    'hi_iam': hiIam,
    'iam': iam,
    'image_iam': imageIam.toJson(),
  };

  factory MainProfile.fromRawJson(String str) =>
      MainProfile.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  static const empty = MainProfile(
    buttonIam: Iam.empty,
    descriptionIam: '',
    hiIam: '',
    iam: '',
    imageIam: Iam.empty,
  );
}

class Iam {
  final String text;
  final String url;

  const Iam({required this.text, required this.url});

  factory Iam.fromJson(Map<String, dynamic> json) =>
      Iam(text: json['text'] as String, url: json['url'] as String);

  Map<String, dynamic> toJson() => {'text': text, 'url': url};

  static const empty = Iam(text: '', url: '');
}
