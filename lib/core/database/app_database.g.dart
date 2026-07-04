// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SavedNewsTableTable extends SavedNewsTable
    with TableInfo<$SavedNewsTableTable, SavedNewsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedNewsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> savedAt =
      GeneratedColumn<int>('saved_at', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<DateTime>($SavedNewsTableTable.$convertersavedAt);
  @override
  late final GeneratedColumnWithTypeConverter<LocalSourceModel?, String>
      source = GeneratedColumn<String>('source', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<LocalSourceModel?>(
              $SavedNewsTableTable.$convertersource);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlToImageMeta =
      const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<String> publishedAt = GeneratedColumn<String>(
      'published_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        savedAt,
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_news';
  @override
  VerificationContext validateIntegrity(Insertable<SavedNewsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedNewsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedNewsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      savedAt: $SavedNewsTableTable.$convertersavedAt.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}saved_at'])!),
      source: $SavedNewsTableTable.$convertersource.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])),
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      urlToImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image']),
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}published_at']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
    );
  }

  @override
  $SavedNewsTableTable createAlias(String alias) {
    return $SavedNewsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $convertersavedAt =
      const DateTimeConverter();
  static TypeConverter<LocalSourceModel?, String?> $convertersource =
      const LocalSourceModelConverter();
}

class SavedNewsTableData extends DataClass
    implements Insertable<SavedNewsTableData> {
  final int id;
  final DateTime savedAt;
  final LocalSourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const SavedNewsTableData(
      {required this.id,
      required this.savedAt,
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['saved_at'] =
          Variable<int>($SavedNewsTableTable.$convertersavedAt.toSql(savedAt));
    }
    if (!nullToAbsent || source != null) {
      map['source'] =
          Variable<String>($SavedNewsTableTable.$convertersource.toSql(source));
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<String>(publishedAt);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    return map;
  }

  SavedNewsTableCompanion toCompanion(bool nullToAbsent) {
    return SavedNewsTableCompanion(
      id: Value(id),
      savedAt: Value(savedAt),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory SavedNewsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedNewsTableData(
      id: serializer.fromJson<int>(json['id']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
      source: serializer.fromJson<LocalSourceModel?>(json['source']),
      author: serializer.fromJson<String?>(json['author']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      url: serializer.fromJson<String?>(json['url']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
      publishedAt: serializer.fromJson<String?>(json['publishedAt']),
      content: serializer.fromJson<String?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'savedAt': serializer.toJson<DateTime>(savedAt),
      'source': serializer.toJson<LocalSourceModel?>(source),
      'author': serializer.toJson<String?>(author),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'url': serializer.toJson<String?>(url),
      'urlToImage': serializer.toJson<String?>(urlToImage),
      'publishedAt': serializer.toJson<String?>(publishedAt),
      'content': serializer.toJson<String?>(content),
    };
  }

  SavedNewsTableData copyWith(
          {int? id,
          DateTime? savedAt,
          Value<LocalSourceModel?> source = const Value.absent(),
          Value<String?> author = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> urlToImage = const Value.absent(),
          Value<String?> publishedAt = const Value.absent(),
          Value<String?> content = const Value.absent()}) =>
      SavedNewsTableData(
        id: id ?? this.id,
        savedAt: savedAt ?? this.savedAt,
        source: source.present ? source.value : this.source,
        author: author.present ? author.value : this.author,
        title: title.present ? title.value : this.title,
        description: description.present ? description.value : this.description,
        url: url.present ? url.value : this.url,
        urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
        publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
        content: content.present ? content.value : this.content,
      );
  SavedNewsTableData copyWithCompanion(SavedNewsTableCompanion data) {
    return SavedNewsTableData(
      id: data.id.present ? data.id.value : this.id,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
      source: data.source.present ? data.source.value : this.source,
      author: data.author.present ? data.author.value : this.author,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      url: data.url.present ? data.url.value : this.url,
      urlToImage:
          data.urlToImage.present ? data.urlToImage.value : this.urlToImage,
      publishedAt:
          data.publishedAt.present ? data.publishedAt.value : this.publishedAt,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedNewsTableData(')
          ..write('id: $id, ')
          ..write('savedAt: $savedAt, ')
          ..write('source: $source, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, savedAt, source, author, title,
      description, url, urlToImage, publishedAt, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedNewsTableData &&
          other.id == this.id &&
          other.savedAt == this.savedAt &&
          other.source == this.source &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.publishedAt == this.publishedAt &&
          other.content == this.content);
}

class SavedNewsTableCompanion extends UpdateCompanion<SavedNewsTableData> {
  final Value<int> id;
  final Value<DateTime> savedAt;
  final Value<LocalSourceModel?> source;
  final Value<String?> author;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> url;
  final Value<String?> urlToImage;
  final Value<String?> publishedAt;
  final Value<String?> content;
  const SavedNewsTableCompanion({
    this.id = const Value.absent(),
    this.savedAt = const Value.absent(),
    this.source = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
  });
  SavedNewsTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime savedAt,
    this.source = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
  }) : savedAt = Value(savedAt);
  static Insertable<SavedNewsTableData> custom({
    Expression<int>? id,
    Expression<int>? savedAt,
    Expression<String>? source,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? publishedAt,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (savedAt != null) 'saved_at': savedAt,
      if (source != null) 'source': source,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishedAt != null) 'published_at': publishedAt,
      if (content != null) 'content': content,
    });
  }

  SavedNewsTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? savedAt,
      Value<LocalSourceModel?>? source,
      Value<String?>? author,
      Value<String?>? title,
      Value<String?>? description,
      Value<String?>? url,
      Value<String?>? urlToImage,
      Value<String?>? publishedAt,
      Value<String?>? content}) {
    return SavedNewsTableCompanion(
      id: id ?? this.id,
      savedAt: savedAt ?? this.savedAt,
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<int>(
          $SavedNewsTableTable.$convertersavedAt.toSql(savedAt.value));
    }
    if (source.present) {
      map['source'] = Variable<String>(
          $SavedNewsTableTable.$convertersource.toSql(source.value));
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedNewsTableCompanion(')
          ..write('id: $id, ')
          ..write('savedAt: $savedAt, ')
          ..write('source: $source, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $SearchHistoryTableTable extends SearchHistoryTable
    with TableInfo<$SearchHistoryTableTable, SearchHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _searchMeta = const VerificationMeta('search');
  @override
  late final GeneratedColumn<String> search = GeneratedColumn<String>(
      'search', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<LocalArticleModel?, String>
      article = GeneratedColumn<String>('article', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<LocalArticleModel?>(
              $SearchHistoryTableTable.$converterarticle);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> createdAt =
      GeneratedColumn<int>('created_at', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<DateTime>(
              $SearchHistoryTableTable.$convertercreatedAt);
  @override
  List<GeneratedColumn> get $columns => [id, search, article, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_history';
  @override
  VerificationContext validateIntegrity(
      Insertable<SearchHistoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('search')) {
      context.handle(_searchMeta,
          search.isAcceptableOrUnknown(data['search']!, _searchMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      search: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}search']),
      article: $SearchHistoryTableTable.$converterarticle.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}article'])),
      createdAt: $SearchHistoryTableTable.$convertercreatedAt.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!),
    );
  }

  @override
  $SearchHistoryTableTable createAlias(String alias) {
    return $SearchHistoryTableTable(attachedDatabase, alias);
  }

  static TypeConverter<LocalArticleModel?, String?> $converterarticle =
      const LocalArticleModelConverter();
  static TypeConverter<DateTime, int> $convertercreatedAt =
      const DateTimeConverter();
}

class SearchHistoryTableData extends DataClass
    implements Insertable<SearchHistoryTableData> {
  final int id;
  final String? search;
  final LocalArticleModel? article;
  final DateTime createdAt;
  const SearchHistoryTableData(
      {required this.id, this.search, this.article, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || search != null) {
      map['search'] = Variable<String>(search);
    }
    if (!nullToAbsent || article != null) {
      map['article'] = Variable<String>(
          $SearchHistoryTableTable.$converterarticle.toSql(article));
    }
    {
      map['created_at'] = Variable<int>(
          $SearchHistoryTableTable.$convertercreatedAt.toSql(createdAt));
    }
    return map;
  }

  SearchHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoryTableCompanion(
      id: Value(id),
      search:
          search == null && nullToAbsent ? const Value.absent() : Value(search),
      article: article == null && nullToAbsent
          ? const Value.absent()
          : Value(article),
      createdAt: Value(createdAt),
    );
  }

  factory SearchHistoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      search: serializer.fromJson<String?>(json['search']),
      article: serializer.fromJson<LocalArticleModel?>(json['article']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'search': serializer.toJson<String?>(search),
      'article': serializer.toJson<LocalArticleModel?>(article),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SearchHistoryTableData copyWith(
          {int? id,
          Value<String?> search = const Value.absent(),
          Value<LocalArticleModel?> article = const Value.absent(),
          DateTime? createdAt}) =>
      SearchHistoryTableData(
        id: id ?? this.id,
        search: search.present ? search.value : this.search,
        article: article.present ? article.value : this.article,
        createdAt: createdAt ?? this.createdAt,
      );
  SearchHistoryTableData copyWithCompanion(SearchHistoryTableCompanion data) {
    return SearchHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      search: data.search.present ? data.search.value : this.search,
      article: data.article.present ? data.article.value : this.article,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryTableData(')
          ..write('id: $id, ')
          ..write('search: $search, ')
          ..write('article: $article, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, search, article, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryTableData &&
          other.id == this.id &&
          other.search == this.search &&
          other.article == this.article &&
          other.createdAt == this.createdAt);
}

class SearchHistoryTableCompanion
    extends UpdateCompanion<SearchHistoryTableData> {
  final Value<int> id;
  final Value<String?> search;
  final Value<LocalArticleModel?> article;
  final Value<DateTime> createdAt;
  const SearchHistoryTableCompanion({
    this.id = const Value.absent(),
    this.search = const Value.absent(),
    this.article = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SearchHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    this.search = const Value.absent(),
    this.article = const Value.absent(),
    required DateTime createdAt,
  }) : createdAt = Value(createdAt);
  static Insertable<SearchHistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? search,
    Expression<String>? article,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (search != null) 'search': search,
      if (article != null) 'article': article,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SearchHistoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? search,
      Value<LocalArticleModel?>? article,
      Value<DateTime>? createdAt}) {
    return SearchHistoryTableCompanion(
      id: id ?? this.id,
      search: search ?? this.search,
      article: article ?? this.article,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (search.present) {
      map['search'] = Variable<String>(search.value);
    }
    if (article.present) {
      map['article'] = Variable<String>(
          $SearchHistoryTableTable.$converterarticle.toSql(article.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
          $SearchHistoryTableTable.$convertercreatedAt.toSql(createdAt.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('search: $search, ')
          ..write('article: $article, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SavedNewsTableTable savedNewsTable = $SavedNewsTableTable(this);
  late final $SearchHistoryTableTable searchHistoryTable =
      $SearchHistoryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [savedNewsTable, searchHistoryTable];
}

typedef $$SavedNewsTableTableCreateCompanionBuilder = SavedNewsTableCompanion
    Function({
  Value<int> id,
  required DateTime savedAt,
  Value<LocalSourceModel?> source,
  Value<String?> author,
  Value<String?> title,
  Value<String?> description,
  Value<String?> url,
  Value<String?> urlToImage,
  Value<String?> publishedAt,
  Value<String?> content,
});
typedef $$SavedNewsTableTableUpdateCompanionBuilder = SavedNewsTableCompanion
    Function({
  Value<int> id,
  Value<DateTime> savedAt,
  Value<LocalSourceModel?> source,
  Value<String?> author,
  Value<String?> title,
  Value<String?> description,
  Value<String?> url,
  Value<String?> urlToImage,
  Value<String?> publishedAt,
  Value<String?> content,
});

class $$SavedNewsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SavedNewsTableTable> {
  $$SavedNewsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get savedAt =>
      $composableBuilder(
          column: $table.savedAt,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<LocalSourceModel?, LocalSourceModel, String>
      get source => $composableBuilder(
          column: $table.source,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urlToImage => $composableBuilder(
      column: $table.urlToImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));
}

class $$SavedNewsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedNewsTableTable> {
  $$SavedNewsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get savedAt => $composableBuilder(
      column: $table.savedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlToImage => $composableBuilder(
      column: $table.urlToImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));
}

class $$SavedNewsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedNewsTableTable> {
  $$SavedNewsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalSourceModel?, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get urlToImage => $composableBuilder(
      column: $table.urlToImage, builder: (column) => column);

  GeneratedColumn<String> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$SavedNewsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SavedNewsTableTable,
    SavedNewsTableData,
    $$SavedNewsTableTableFilterComposer,
    $$SavedNewsTableTableOrderingComposer,
    $$SavedNewsTableTableAnnotationComposer,
    $$SavedNewsTableTableCreateCompanionBuilder,
    $$SavedNewsTableTableUpdateCompanionBuilder,
    (
      SavedNewsTableData,
      BaseReferences<_$AppDatabase, $SavedNewsTableTable, SavedNewsTableData>
    ),
    SavedNewsTableData,
    PrefetchHooks Function()> {
  $$SavedNewsTableTableTableManager(
      _$AppDatabase db, $SavedNewsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedNewsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedNewsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedNewsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> savedAt = const Value.absent(),
            Value<LocalSourceModel?> source = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> urlToImage = const Value.absent(),
            Value<String?> publishedAt = const Value.absent(),
            Value<String?> content = const Value.absent(),
          }) =>
              SavedNewsTableCompanion(
            id: id,
            savedAt: savedAt,
            source: source,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime savedAt,
            Value<LocalSourceModel?> source = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> urlToImage = const Value.absent(),
            Value<String?> publishedAt = const Value.absent(),
            Value<String?> content = const Value.absent(),
          }) =>
              SavedNewsTableCompanion.insert(
            id: id,
            savedAt: savedAt,
            source: source,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SavedNewsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SavedNewsTableTable,
    SavedNewsTableData,
    $$SavedNewsTableTableFilterComposer,
    $$SavedNewsTableTableOrderingComposer,
    $$SavedNewsTableTableAnnotationComposer,
    $$SavedNewsTableTableCreateCompanionBuilder,
    $$SavedNewsTableTableUpdateCompanionBuilder,
    (
      SavedNewsTableData,
      BaseReferences<_$AppDatabase, $SavedNewsTableTable, SavedNewsTableData>
    ),
    SavedNewsTableData,
    PrefetchHooks Function()>;
typedef $$SearchHistoryTableTableCreateCompanionBuilder
    = SearchHistoryTableCompanion Function({
  Value<int> id,
  Value<String?> search,
  Value<LocalArticleModel?> article,
  required DateTime createdAt,
});
typedef $$SearchHistoryTableTableUpdateCompanionBuilder
    = SearchHistoryTableCompanion Function({
  Value<int> id,
  Value<String?> search,
  Value<LocalArticleModel?> article,
  Value<DateTime> createdAt,
});

class $$SearchHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $SearchHistoryTableTable> {
  $$SearchHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get search => $composableBuilder(
      column: $table.search, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LocalArticleModel?, LocalArticleModel, String>
      get article => $composableBuilder(
          column: $table.article,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get createdAt =>
      $composableBuilder(
          column: $table.createdAt,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$SearchHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchHistoryTableTable> {
  $$SearchHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get search => $composableBuilder(
      column: $table.search, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get article => $composableBuilder(
      column: $table.article, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SearchHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchHistoryTableTable> {
  $$SearchHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get search =>
      $composableBuilder(column: $table.search, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalArticleModel?, String> get article =>
      $composableBuilder(column: $table.article, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SearchHistoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SearchHistoryTableTable,
    SearchHistoryTableData,
    $$SearchHistoryTableTableFilterComposer,
    $$SearchHistoryTableTableOrderingComposer,
    $$SearchHistoryTableTableAnnotationComposer,
    $$SearchHistoryTableTableCreateCompanionBuilder,
    $$SearchHistoryTableTableUpdateCompanionBuilder,
    (
      SearchHistoryTableData,
      BaseReferences<_$AppDatabase, $SearchHistoryTableTable,
          SearchHistoryTableData>
    ),
    SearchHistoryTableData,
    PrefetchHooks Function()> {
  $$SearchHistoryTableTableTableManager(
      _$AppDatabase db, $SearchHistoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchHistoryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> search = const Value.absent(),
            Value<LocalArticleModel?> article = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SearchHistoryTableCompanion(
            id: id,
            search: search,
            article: article,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> search = const Value.absent(),
            Value<LocalArticleModel?> article = const Value.absent(),
            required DateTime createdAt,
          }) =>
              SearchHistoryTableCompanion.insert(
            id: id,
            search: search,
            article: article,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SearchHistoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SearchHistoryTableTable,
    SearchHistoryTableData,
    $$SearchHistoryTableTableFilterComposer,
    $$SearchHistoryTableTableOrderingComposer,
    $$SearchHistoryTableTableAnnotationComposer,
    $$SearchHistoryTableTableCreateCompanionBuilder,
    $$SearchHistoryTableTableUpdateCompanionBuilder,
    (
      SearchHistoryTableData,
      BaseReferences<_$AppDatabase, $SearchHistoryTableTable,
          SearchHistoryTableData>
    ),
    SearchHistoryTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SavedNewsTableTableTableManager get savedNewsTable =>
      $$SavedNewsTableTableTableManager(_db, _db.savedNewsTable);
  $$SearchHistoryTableTableTableManager get searchHistoryTable =>
      $$SearchHistoryTableTableTableManager(_db, _db.searchHistoryTable);
}
