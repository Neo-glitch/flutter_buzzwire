import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;
  final String code;

  const CountryEntity({
    required this.name,
    required this.code,
  });

  @override
  List<Object?> get props => [name, code];
}
