import 'package:flutter/material.dart';

class DependenciesWrapper extends InheritedWidget {
  DependenciesWrapper({@required this.child, this.dependence})
      : super(child: child);
  final Widget child;
  final dynamic dependence;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    if (oldWidget is DependenciesWrapper) {
      return oldWidget.child == this.child;
    }
    return false;
  }

  static DependenciesWrapper of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(DependenciesWrapper)
        as DependenciesWrapper;
  }
}
