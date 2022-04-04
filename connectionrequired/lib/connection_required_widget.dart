import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class ConnectionRequiredWidget extends StatefulWidget {
  final Widget child;
  final bool updateOnConnectionRestored;
  final bool updateOnConnectionLost;

  const ConnectionRequiredWidget(
      {Key key,
      @required this.child,
      this.updateOnConnectionRestored = true,
      this.updateOnConnectionLost = true})
      : super(key: key);

  @override
  _ConnectionRequiredWidgetState createState() =>
      _ConnectionRequiredWidgetState();
}

class _ConnectionRequiredWidgetState extends State<ConnectionRequiredWidget> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _subscription;
  ConnectivityResult _connectionStatus;

  @override
  void initState() {
    super.initState();

    initConnectivity();

    _subscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    print("_connectionStatus = $_connectionStatus, result = $result");
    if (_isConnectionRestored(result) && widget.updateOnConnectionRestored) {
      setState(() => _connectionStatus = result);
    } else if (_isConnectionLost(result) && widget.updateOnConnectionLost) {
      setState(() => _connectionStatus = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      if (!_isActiveStatus(_connectionStatus)) {
        return _NoConnectionWidget();
      } else {
        return widget.child;
      }
    });
  }

  bool _isConnectionRestored(ConnectivityResult result) {
    return !_isActiveStatus(_connectionStatus) && _isActiveStatus(result);
  }

  bool _isConnectionLost(ConnectivityResult result) {
    return !_isActiveStatus(result) && _isActiveStatus(_connectionStatus);
  }

  bool _isActiveStatus(ConnectivityResult result) {
    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}

class _NoConnectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: MediaQuery.of(context).size.width * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Please check your network connection"),
            )
          ],
        ),
      ),
    );
  }
}

class _WaitingForConnectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Waiting for network connection"),
        )
      ],
    )));
  }
}
