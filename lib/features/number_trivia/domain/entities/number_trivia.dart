import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

//*
// model
// */

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  NumberTrivia({
    required this.text, 
    required this.number
  }) : super();
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}