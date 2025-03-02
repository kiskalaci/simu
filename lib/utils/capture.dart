import "package:flutter/foundation.dart";

/// A typedef representing the captured result of a future operation.
typedef CaptureData<T> = ({T? data, Object? error});

/// Captures the result of a [Future] operation, returning an object containing
/// either the resolved data or the caught error.
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
