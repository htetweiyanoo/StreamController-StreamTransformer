import 'dart:async';

void main() {
  var streamController = StreamController<String>.broadcast(
    onListen: () => print('onListen'),
    onCancel: () => print('onCancel'),
  );

  StreamSubscription sub = streamController.stream.listen(
      (data) => print('Got $data'),
      onError: (err) => print("Got $err"),
      onDone: () => print("Done!"));

  StreamSubscription sub2 =
      streamController.stream.listen((data) => print("My $data"));

  streamController.sink.add("Myanmar Links");
  sub.pause();
  sub.resume();
  streamController.sink.add("Flutter Application Developer");
  streamController.sink.addError("Something went wrong");
  streamController.sink.close();
}
