class Token {
  String? accessToken;
  String? identityToken;
  String? scope;
  String? issuedTokenType;
  String? tokenType;
  String? refreshToken;
  String? errorDescription;
  int? expiresIn;

  Token({
    this.accessToken,
    this.identityToken,
    this.scope,
    this.issuedTokenType,
    this.tokenType,
    this.refreshToken,
    this.errorDescription,
    this.expiresIn,
  });

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    identityToken = json['identityToken'];
    scope = json['scope'];
    issuedTokenType = json['issuedTokenType'];
    tokenType = json['tokenType'];
    refreshToken = json['refreshToken'];
    errorDescription = json['errorDescription'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['identityToken'] = this.identityToken;
    data['scope'] = this.scope;
    data['issuedTokenType'] = this.issuedTokenType;
    data['tokenType'] = this.tokenType;
    data['refreshToken'] = this.refreshToken;
    data['errorDescription'] = this.errorDescription;
    data['expiresIn'] = this.expiresIn;
    return data;
  }
}
