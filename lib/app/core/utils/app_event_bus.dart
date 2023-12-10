import 'package:get/get.dart';
import 'package:quickreels/app/features/shared/events/events.dart';

class AppEventBus extends GetxService {
  final _events = Rx<GetEvent>(GetEvent());

  Rx<GetEvent> get events => _events;

  void sendEvent(GetEvent newEvent) {
    _events(newEvent);
  }
}