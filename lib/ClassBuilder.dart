
import 'package:hospital/AddDetails.dart';
import 'package:hospital/Home.dart';
import 'package:hospital/Login.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<AddDetails>(() => AddDetails());
    register<Login>(() => Login());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
