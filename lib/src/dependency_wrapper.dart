import 'package:flutter/material.dart';

class DependenciesWrapper<T> extends InheritedWidget {
  DependenciesWrapper({Widget child, this.dependence}) : super(child: child);

  final T dependence;

  static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    if (oldWidget is DependenciesWrapper) {
      return oldWidget.child == this.child;
    }
    return false;
  }

  static DependenciesWrapper<T> of<T>(BuildContext context) {
    Type type = _typeOf<DependenciesWrapper<T>>();
    return context.inheritFromWidgetOfExactType(type) as DependenciesWrapper<T>;
  }
}
