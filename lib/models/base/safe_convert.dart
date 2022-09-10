import 'package:flutter/cupertino.dart';
import 'package:kanoon_dadgostari/utilites/string_extensions.dart';

T asT<T>(Map<String, dynamic>? json, String key, {T? defaultValue}) {
  if (json == null || !json.containsKey(key)) {
    if (defaultValue != null) return defaultValue;
    if (0 is T) return 0 as T;
    if (0.0 is T) return 0.0 as T;
    if ('' is T) return '' as T;
    if (false is T) return false as T;
    if ([] is T) return [] as T;
    if (<String, dynamic>{} is T) return <String, dynamic>{} as T;
    return '' as T;
  }
  dynamic value = json[key];
  if (value is T) return value;

  if (0 is T) {
    defaultValue ??= 0 as T;
    if (value is double) {
      return value.toInt() as T;
    } else if (value is bool) {
      return (value ? 1 : 0) as T;
    } else if (value is String) {
      return (int.tryParse(value) ??
          double.tryParse(value)?.toInt() ??
          defaultValue) as T;
    } else {
      return defaultValue!;
    }
  } else if (0.0 is T) {
    defaultValue ??= 0.0 as T;
    if (value is int) {
      return value.toDouble() as T;
    } else if (value is bool) {
      return (value ? 1.0 : 0.0) as T;
    } else if (value is String) {
      return (double.tryParse(value) ?? defaultValue) as T;
    } else {
      return defaultValue!;
    }
  } else if ('' is T) {
    defaultValue ??= '' as T;
    if (value is int || value is double) {
      return value.toString() as T;
    } else if (value is bool) {
      return (value ? "true" : "false") as T;
    } else {
      return defaultValue!;
    }
  } else if (false is T) {
    defaultValue ??= false as T;
    String valueS = value.toString();
    if (valueS == '1' || valueS == '1.0' || valueS.toLowerCase() == 'true') {
      return true as T;
    }
    return defaultValue!;
  } else if ([] is T) {
    try {
      if (T is List<String>) {
        defaultValue ??= <String>[] as T;
        if (value != '') {
          String a = value as String;
          return a.toStringList() as T;
        }

        return defaultValue as T;
      }

      defaultValue ??= [] as T;

      if (value is String) {
        return value.toJsonList() as T;
      } else if (value is List<Map<String, dynamic>>) {
        return value as T;
      }

      return defaultValue!;
    } catch (e) {
      debugPrint("$e");
      return [] as T;
    }
  } else if (<String>[] is T) {
    defaultValue ??= <String>[] as T;
    if (value == null) {
      defaultValue ??= <String>[] as T;
    } else if (value != null) {
      List<String> out = [];
      var input = (value as List<dynamic>);
      for (String x in input) {
        out.add(x);
      }

      return out as T;
    }

    return defaultValue as T;
  } else if (DateTime.now() is T) {
    String srt = value as String;
    return srt.fromJsonDateTime() as T;
  } else if (<String, dynamic>{} is T) {
    defaultValue ??= <String, dynamic>{} as T;
    return defaultValue!;
  }
  return '' as T;
}
