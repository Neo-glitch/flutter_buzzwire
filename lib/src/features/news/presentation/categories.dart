import 'package:buzzwire/core/common/utils/string_util.dart';

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
