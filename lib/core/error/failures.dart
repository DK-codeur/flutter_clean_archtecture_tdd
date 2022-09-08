import 'package:equatable/equatable.dart';


//**
//Les erreur viendront ici comme la co
// */


abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();

  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  // Failure([List properties = const <dynamic>[]]) : super(properties);
}