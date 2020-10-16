import 'person.dart';

class PersonResponse {
  final List<Person> persons;
  final String error;

  PersonResponse({this.persons, this.error});

  PersonResponse.fromJson(Map<String, dynamic> json)
      : persons = (json['persons'] as List)
            .map((index) => Person.fromJson(json))
            .toList(),
        error = "";

  PersonResponse.withError(String errorValue)
      : persons = List(),
        error = errorValue;
}
