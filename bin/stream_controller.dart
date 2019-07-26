import 'dart:async';

void main() {
  var streamController = StreamController<String>(
    onListen: () => print('onListen'),
    onCancel: () => print("onCancel"),
    onPause: () => print("onPause"),
    onResume: () => print("onResume")
  );

  StreamSubscription sub = streamController.stream.listen(
      (data) => print('Got $data'),
      onError: (err) => print("Got $err"),
      onDone: () => print("Done!")
  );

  streamController.sink.add("Myanmar Links");
  sub.pause();
  sub.resume();
  streamController.sink.add("Flutter Application Developer");
  streamController.sink.addError("Something went wrong");
  streamController.sink.close();
}
