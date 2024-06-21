
import 'package:event_bus/event_bus.dart';

EventBus eventBus=EventBus();

class MessageEvent{
  int? type;
  Object? object;
  MessageEvent(this.type, this.object);
}