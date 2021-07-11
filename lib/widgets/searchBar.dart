import 'package:flutter/material.dart';
import 'package:venko/dtos/personDto.dart';
import 'package:venko/utils/constants.dart';

class SearchDoctor extends SearchDelegate<String> {
  final List<PersonDto> doctors;
  String result;

  SearchDoctor(this.doctors);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, result);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = doctors.where((person) {
      return person.documentNumber.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            '${suggestions.elementAt(index).firstName} ${suggestions.elementAt(index).firstLastName}',
          ),
           subtitle: Text(
            'CC ${suggestions.elementAt(index).documentNumber}'
          ),
          onTap: () {
            result = suggestions.elementAt(index).documentNumber;
            close(context, result);
            Navigator.pushNamed(context, DETAIL_DOCTOR_ROUTE, arguments: suggestions.first);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = doctors.where((person) {
      return person.documentNumber.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            '${suggestions.elementAt(index).firstName} ${suggestions.elementAt(index).firstLastName}',
          ),
           subtitle: Text(
            'CC ${suggestions.elementAt(index).documentNumber}'
          ),
          onTap: () {
            query = suggestions.elementAt(index).documentNumber;
          },
        );
      },
    );
  }
}