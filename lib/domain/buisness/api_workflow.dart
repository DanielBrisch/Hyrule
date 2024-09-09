import 'package:hyrule/domain/models/entry.dart';

abstract class ApiWorkflow {
  Future<List<Entry>> getEntreyByCategory({required String category});
}
