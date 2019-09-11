import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DependenciesWrapper<T> extends InheritedWidget {
  final Widget child;
  final T dependence;

  DependenciesWrapper({this.child, this.dependence}) : super(child: child);

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
