import 'dart:async';

main(List<String> arguments) {
  var controller = StreamController<String>.broadcast();
  var streamTransformer = StreamTransformer<String, String>.fromHandlers(
      handleData: (String data, EventSink sink) {
    switch (data) {
      case "fool":
        sink.add("You $data");
        break;
      case "idiot":
        sink.add("You're $data");
        break;
      default:
        sink.add(data);
    }
  }, handleError: (Object error, StackTrace stacktrace, EventSink sink) {
    sink.addError("Something went wrong: $error");
  }, handleDone: (EventSink sink) {
    print("Controller Closed");
    sink.close();
  });

  var streamController = controller.stream.transform(streamTransformer);

  streamController.listen(print);
  streamController.listen(print);

  controller.sink.add("fool");
  controller.sink.add("idiot");
  controller.sink.add("Howdy");
  controller.addError("Hello");
  controller.sink.close();
}
