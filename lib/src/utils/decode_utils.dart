/// Used for parsing values that shouldn't be null.
T checkFor<T>(
  String key, {
  required Map from,
  T? defaultValue,
  T Function(dynamic value)? decoder,
}) {
  final data = Map<String, dynamic>.from(from);
  if (decoder != null) {
    if (data[key] == null && defaultValue != null) return defaultValue;
    if (data[key] == null) throw "Default value was not specified";
    return decoder(data[key]);
  }

  if (data[key] == null && defaultValue != null) return defaultValue;
  if (data[key] == null) throw "Default value was not specified";
  if (data[key] is T) return data[key];

  throw '''
        Parse error:
        key: $key
        Value: ${data[key]} 
        Expected type: $T
  ''';
}

/// Used for parsing values that may be null.
T? nullableCheckFor<T>(
  String key, {
  required Map from,
  T? defaultValue,
  T Function(dynamic value)? decoder,
}) {
  final data = Map<String, dynamic>.from(from);
  if (decoder != null) {
    if (data[key] == null && defaultValue != null) return defaultValue;
    if (data[key] == null) return null;
    return decoder(data[key]);
  }

  if (data[key] == null && defaultValue != null) return defaultValue;
  if (data[key] == null) return null;
  if (data[key] is T) return data[key];

  throw '''
        Parse error:
        key: $key
        Value: ${data[key]} 
        Expected type: $T
  ''';
}
