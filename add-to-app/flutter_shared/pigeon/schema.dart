import 'package:pigeon/pigeon.dart';

class PersonMessageModel {
  late String name;
}

@FlutterApi()
abstract class FlutterApi {
  void displayPerson(PersonMessageModel person);
}

@HostApi()
abstract class NativeApi {
  PersonMessageModel getPerson();
}
