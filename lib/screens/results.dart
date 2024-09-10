import 'package:flutter/material.dart';
import 'package:hyrule/data/controller/api_controller.dart';
import 'package:hyrule/screens/components/entry_card.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Results extends StatelessWidget {
  final String category;
  final ApiController apiController = ApiController();

  Results({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categories[category]!),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: apiController.getEntreyByCategory(category: category),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                break;
              case ConnectionState.none:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return EntryCard(
                        entry: snapshot.data![index],
                      );
                    },
                  );
                }
                break;
              case ConnectionState.waiting:
                const Center(
                  child: CircularProgressIndicator(),
                );
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
