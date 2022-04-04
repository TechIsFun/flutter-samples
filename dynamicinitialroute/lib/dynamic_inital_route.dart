import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef InitialRouteWidgetBuilder = Widget Function(
    BuildContext context, String initialRoute);

class DynamicInitialRoute extends StatefulWidget {
  final String defaultRoute;
  final InitialRouteWidgetBuilder childWidgetBuilder;

  const DynamicInitialRoute(
      {Key key, @required this.defaultRoute, @required this.childWidgetBuilder})
      : super(key: key);

  @override
  DynamicInitialRouteState createState() => DynamicInitialRouteState();

  static DynamicInitialRouteState of(BuildContext context) {
    return context.findAncestorStateOfType<State<DynamicInitialRoute>>();
  }
}

class DynamicInitialRouteState extends State<DynamicInitialRoute> {
  Future<String> _initialRouteFuture;

  static const String _sharedPreferencesKey = 'initialRoutePrefKey';

  @override
  void initState() {
    super.initState();

    _initialRouteFuture = _loadInitialRoute();
  }

  Future<String> _loadInitialRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sharedPreferencesKey) ?? widget.defaultRoute;
  }

  Future<void> setInitialRoute(String route) async {
    assert(route != null);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sharedPreferencesKey, route);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialRouteFuture,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return widget.childWidgetBuilder(context, snapshot.data);
          } else {
            return Container();
          }
        });
  }
}
