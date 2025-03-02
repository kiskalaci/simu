import "package:flutter/foundation.dart";

typedef CaptureData<T> = ({T? data, Object? error});

Future<CaptureData<T>> capture<T>(Future<T> future) async {
  T? data;
  Object? error;
  await future
      .then((d) {
        data = d;
      })
      .catchError((e) {
        error = e;
        if (kDebugMode) {
          print(e);
        }
      });

  return (data: data, error: error);
}
