import '../../domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({
    required String accessToken,
    required String refreshToken,
  }) : super(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }


}