import 'package:flutter/material.dart';

abstract class DependenciesWrapper<T> extends InheritedWidget {
  final Widget child;
  final T dependence;

  DependenciesWrapper({this.child, this.dependence}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    if (oldWidget is DependenciesWrapper) {
      oldWidget.child == this.child;
    }
    return null;
  }

  static DependenciesWrapper of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(DependenciesWrapper)
        as DependenciesWrapper;
  }
}
