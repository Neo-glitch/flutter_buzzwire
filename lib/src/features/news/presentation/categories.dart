import 'package:buzzwire/core/utils/extensions/string_extension.dart';

enum NewsCategory {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology,
}

List<String> categories =
    NewsCategory.values.map((value) => value.name.toCapitalized).toList();
