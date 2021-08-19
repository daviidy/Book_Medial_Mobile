import 'dart:convert';

class SessionModels {
  final String key;
  final dynamic value;

  SessionModels({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': jsonEncode(value),
    };
  }

  factory SessionModels.fromJson(Map<String, dynamic> json) {
    return SessionModels(
      key: json['key'],
      value: (json['value'] != null) ? jsonDecode(json['value']) : null,
    );
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'SessionModel{key: $key, value: $value}';
  }
}

class WsResponse {
  bool status;
  String? message;
  Map? reponse;

  WsResponse({this.message, this.reponse, this.status = false});
}
