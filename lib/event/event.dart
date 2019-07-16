import 'package:event_bus/event_bus.dart';
EventBus bus = EventBus();

class ThemeEvent {
  int theme;
  bool darkTheme;

  ThemeEvent(this.theme, this.darkTheme);
}


class EditTodoEvent {
  int type;

  EditTodoEvent(this.type);
}

class FavoriteEvent {
  FavoriteEvent();
}
