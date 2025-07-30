import 'package:equatable/equatable.dart';

class StopSearchResult extends Equatable {
  final String id;
  final String name;
  final List<String> modes;

  const StopSearchResult({
    required this.id,
    required this.name,
    required this.modes,
  });

  @override
  List<Object?> get props => [id, name, modes];
}
