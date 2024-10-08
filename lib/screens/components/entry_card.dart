import 'package:flutter/material.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/components/details.dart';

class EntryCard extends StatelessWidget {
  final Entry entry;
  const EntryCard({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(entry: entry),
                ),
              );
            },
            child: Ink(
              child: Row(
                children: [
                  Image.network(entry.image),
                  Column(
                    children: [
                      Text(entry.name),
                      Text(entry.description),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Wrap(
            children: entry
                .commonLocationsConverter()
                .map(
                  (e) => Chip(
                    label: Text(e),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
