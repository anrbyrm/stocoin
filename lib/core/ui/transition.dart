import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stocoin/core/bootstrap/helpers.dart';

class OpacityPageRoute<T> extends PageRoute<T> {
  OpacityPageRoute({
    required this.builder,
    required this.duration,
    required this.currentPage,
    RouteSettings? settings,
    bool? fullscreenDialog = false,
  }) : super(
          settings: settings,
          fullscreenDialog: fullscreenDialog!,
        );

  final WidgetBuilder? builder;
  final Duration? duration;
  final Widget? currentPage;

  @override
  Duration get transitionDuration => duration!;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = builder!(context);
    assert(
      () {
        if (builder == null) {
          throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
            'Route builders must never return null.',
          );
        }
        return true;
      }(),
    );
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _OpacityPageTransition(
      routeAnimation: animation,
      oldPage: currentPage,
      child: child,
    );
  }

  @override
  bool canTransitionFrom(TransitionRoute? previousRoute) {
    return previousRoute is OpacityPageRoute;
  }

  @override
  bool canTransitionTo(TransitionRoute nextRoute) {
    return nextRoute is OpacityPageRoute && !nextRoute.fullscreenDialog;
  }
}

class _OpacityPageTransition extends HookWidget {
  _OpacityPageTransition({
    Key? key,
    required Animation<double> routeAnimation,
    required this.child,
    required Widget? oldPage,
  })  : _opacityAnimation = CurvedAnimation(
          parent: routeAnimation,
          curve: const Interval(.6, 1, curve: Curves.easeOutQuart),
        ).drive(Tween<double>(begin: 0, end: 1)),
        _secondaryOpacity = CurvedAnimation(
          parent: routeAnimation,
          curve: const Interval(0, .55, curve: Curves.fastOutSlowIn),
        ).drive(Tween<double>(begin: 1, end: 0)),
        _oldPage = oldPage,
        super(key: key);

  // static final _fastSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);

  final Animation<double>? _opacityAnimation;
  final Animation<double>? _secondaryOpacity;
  final Widget? _oldPage;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: get(context).scaffold,
      child: Stack(
        children: <Widget>[
          FadeTransition(
            opacity: _secondaryOpacity!,
            child: _oldPage,
          ),
          FadeTransition(
            opacity: _opacityAnimation!,
            child: child,
          ),
        ],
      ),
    );
  }
}
