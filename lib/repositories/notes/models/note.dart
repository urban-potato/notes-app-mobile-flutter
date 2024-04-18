import 'package:equatable/equatable.dart';

class Note extends Equatable {
  const Note({
    required this.id,
    required this.title,
    this.description,
    required this.dateTime,
  });

  final int id;
  final String title;
  final String? description;
  final String dateTime;

  @override
  List<Object?> get props => [];
}
