import 'package:flutter/cupertino.dart';

abstract class DependenciesWrapper extends InheritedWidget {
  Widget child;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    if (oldWidget is DependenciesWrapper) {
      oldWidget.child == this.child;
    }
    return null;
  }

  static T of<T extends DependenciesWrapper>(BuildContext context) {
    return context.inheritFromWidgetOfExactType(T) as T;
  }
}
