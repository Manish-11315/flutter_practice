import 'package:injectable/injectable.dart';

abstract class demo1{}

@LazySingleton(as: demo1)
class demo2 extends demo1{}

@lazySingleton
class demo3{
  final demo2 demo2instance;
  demo3({ required this.demo2instance});
}

@lazySingleton
class demo4{
  final demo3 demo3instance;
  demo4({required this.demo3instance});
}

@lazySingleton
class demo5{
  final demo3 demo3instance;
  demo5({required this.demo3instance});
}