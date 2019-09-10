import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
abstract class DependenciesWrapper extends InheritedWidget {
  Widget child;

  DependenciesWrapper({this.child}) : super(child: child);

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
