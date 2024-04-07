// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_books.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetBooksListCollection on Isar {
  IsarCollection<int, BooksList> get booksLists => this.collection();
}

const BooksListSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'BooksList',
    idName: 'count',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'next',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'previous',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'results',
        type: IsarType.objectList,
        target: 'NewBook',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, BooksList>(
    serialize: serializeBooksList,
    deserialize: deserializeBooksList,
    deserializeProperty: deserializeBooksListProp,
  ),
  embeddedSchemas: [NewBookSchema, AuthorSchema, FormatsSchema],
);

@isarProtected
int serializeBooksList(IsarWriter writer, BooksList object) {
  IsarCore.writeString(writer, 1, object.next);
  {
    final value = object.previous;
    if (value == null) {
      IsarCore.writeNull(writer, 2);
    } else {
      IsarCore.writeString(writer, 2, value);
    }
  }
  {
    final list = object.results;
    final listWriter = IsarCore.beginList(writer, 3, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeNewBook(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.count;
}

@isarProtected
BooksList deserializeBooksList(IsarReader reader) {
  final int _count;
  _count = IsarCore.readId(reader);
  final String _next;
  _next = IsarCore.readString(reader, 1) ?? '';
  final String? _previous;
  _previous = IsarCore.readString(reader, 2);
  final List<NewBook> _results;
  {
    final length = IsarCore.readList(reader, 3, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _results = const <NewBook>[];
      } else {
        final list = List<NewBook>.filled(
            length,
            NewBook(
              id: -9223372036854775808,
              title: '',
              authors: const <Author>[],
              translators: const <Author>[],
              subjects: const <String>[],
              bookshelves: const <String>[],
              languages: const <Language>[],
              copyright: false,
              mediaType: MediaType.TEXT,
              formats: null,
              downloadCount: -9223372036854775808,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = NewBook(
                id: -9223372036854775808,
                title: '',
                authors: const <Author>[],
                translators: const <Author>[],
                subjects: const <String>[],
                bookshelves: const <String>[],
                languages: const <Language>[],
                copyright: false,
                mediaType: MediaType.TEXT,
                formats: null,
                downloadCount: -9223372036854775808,
              );
            } else {
              final embedded = deserializeNewBook(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _results = list;
      }
    }
  }
  final object = BooksList(
    count: _count,
    next: _next,
    previous: _previous,
    results: _results,
  );
  return object;
}

@isarProtected
dynamic deserializeBooksListProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2);
    case 3:
      {
        final length = IsarCore.readList(reader, 3, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <NewBook>[];
          } else {
            final list = List<NewBook>.filled(
                length,
                NewBook(
                  id: -9223372036854775808,
                  title: '',
                  authors: const <Author>[],
                  translators: const <Author>[],
                  subjects: const <String>[],
                  bookshelves: const <String>[],
                  languages: const <Language>[],
                  copyright: false,
                  mediaType: MediaType.TEXT,
                  formats: null,
                  downloadCount: -9223372036854775808,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = NewBook(
                    id: -9223372036854775808,
                    title: '',
                    authors: const <Author>[],
                    translators: const <Author>[],
                    subjects: const <String>[],
                    bookshelves: const <String>[],
                    languages: const <Language>[],
                    copyright: false,
                    mediaType: MediaType.TEXT,
                    formats: null,
                    downloadCount: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializeNewBook(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _BooksListUpdate {
  bool call({
    required int count,
    String? next,
    String? previous,
  });
}

class _BooksListUpdateImpl implements _BooksListUpdate {
  const _BooksListUpdateImpl(this.collection);

  final IsarCollection<int, BooksList> collection;

  @override
  bool call({
    required int count,
    Object? next = ignore,
    Object? previous = ignore,
  }) {
    return collection.updateProperties([
          count
        ], {
          if (next != ignore) 1: next as String?,
          if (previous != ignore) 2: previous as String?,
        }) >
        0;
  }
}

sealed class _BooksListUpdateAll {
  int call({
    required List<int> count,
    String? next,
    String? previous,
  });
}

class _BooksListUpdateAllImpl implements _BooksListUpdateAll {
  const _BooksListUpdateAllImpl(this.collection);

  final IsarCollection<int, BooksList> collection;

  @override
  int call({
    required List<int> count,
    Object? next = ignore,
    Object? previous = ignore,
  }) {
    return collection.updateProperties(count, {
      if (next != ignore) 1: next as String?,
      if (previous != ignore) 2: previous as String?,
    });
  }
}

extension BooksListUpdate on IsarCollection<int, BooksList> {
  _BooksListUpdate get update => _BooksListUpdateImpl(this);

  _BooksListUpdateAll get updateAll => _BooksListUpdateAllImpl(this);
}

sealed class _BooksListQueryUpdate {
  int call({
    String? next,
    String? previous,
  });
}

class _BooksListQueryUpdateImpl implements _BooksListQueryUpdate {
  const _BooksListQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<BooksList> query;
  final int? limit;

  @override
  int call({
    Object? next = ignore,
    Object? previous = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (next != ignore) 1: next as String?,
      if (previous != ignore) 2: previous as String?,
    });
  }
}

extension BooksListQueryUpdate on IsarQuery<BooksList> {
  _BooksListQueryUpdate get updateFirst =>
      _BooksListQueryUpdateImpl(this, limit: 1);

  _BooksListQueryUpdate get updateAll => _BooksListQueryUpdateImpl(this);
}

class _BooksListQueryBuilderUpdateImpl implements _BooksListQueryUpdate {
  const _BooksListQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<BooksList, BooksList, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? next = ignore,
    Object? previous = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (next != ignore) 1: next as String?,
        if (previous != ignore) 2: previous as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension BooksListQueryBuilderUpdate
    on QueryBuilder<BooksList, BooksList, QOperations> {
  _BooksListQueryUpdate get updateFirst =>
      _BooksListQueryBuilderUpdateImpl(this, limit: 1);

  _BooksListQueryUpdate get updateAll => _BooksListQueryBuilderUpdateImpl(this);
}

extension BooksListQueryFilter
    on QueryBuilder<BooksList, BooksList, QFilterCondition> {
  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> countEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> countGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      countGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> countLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      countLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> countBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      nextGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      nextLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> nextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      previousIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      previousGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      previousLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> previousIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      previousIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition> resultsIsEmpty() {
    return not().resultsIsNotEmpty();
  }

  QueryBuilder<BooksList, BooksList, QAfterFilterCondition>
      resultsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 3, value: null),
      );
    });
  }
}

extension BooksListQueryObject
    on QueryBuilder<BooksList, BooksList, QFilterCondition> {}

extension BooksListQuerySortBy on QueryBuilder<BooksList, BooksList, QSortBy> {
  QueryBuilder<BooksList, BooksList, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> sortByNext(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> sortByNextDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> sortByPrevious(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> sortByPreviousDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension BooksListQuerySortThenBy
    on QueryBuilder<BooksList, BooksList, QSortThenBy> {
  QueryBuilder<BooksList, BooksList, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> thenByNext(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> thenByNextDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> thenByPrevious(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterSortBy> thenByPreviousDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension BooksListQueryWhereDistinct
    on QueryBuilder<BooksList, BooksList, QDistinct> {
  QueryBuilder<BooksList, BooksList, QAfterDistinct> distinctByNext(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BooksList, BooksList, QAfterDistinct> distinctByPrevious(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }
}

extension BooksListQueryProperty1
    on QueryBuilder<BooksList, BooksList, QProperty> {
  QueryBuilder<BooksList, int, QAfterProperty> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BooksList, String, QAfterProperty> nextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BooksList, String?, QAfterProperty> previousProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BooksList, List<NewBook>, QAfterProperty> resultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension BooksListQueryProperty2<R>
    on QueryBuilder<BooksList, R, QAfterProperty> {
  QueryBuilder<BooksList, (R, int), QAfterProperty> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BooksList, (R, String), QAfterProperty> nextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BooksList, (R, String?), QAfterProperty> previousProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BooksList, (R, List<NewBook>), QAfterProperty>
      resultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension BooksListQueryProperty3<R1, R2>
    on QueryBuilder<BooksList, (R1, R2), QAfterProperty> {
  QueryBuilder<BooksList, (R1, R2, int), QOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BooksList, (R1, R2, String), QOperations> nextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BooksList, (R1, R2, String?), QOperations> previousProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BooksList, (R1, R2, List<NewBook>), QOperations>
      resultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const NewBookSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'NewBook',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'title',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'authors',
        type: IsarType.objectList,
        target: 'Author',
      ),
      IsarPropertySchema(
        name: 'translators',
        type: IsarType.objectList,
        target: 'Author',
      ),
      IsarPropertySchema(
        name: 'subjects',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'bookshelves',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'languages',
        type: IsarType.byteList,
        enumMap: {"EN": 0},
      ),
      IsarPropertySchema(
        name: 'copyright',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'mediaType',
        type: IsarType.byte,
        enumMap: {"TEXT": 0},
      ),
      IsarPropertySchema(
        name: 'formats',
        type: IsarType.object,
        target: 'Formats',
      ),
      IsarPropertySchema(
        name: 'downloadCount',
        type: IsarType.long,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, NewBook>(
    serialize: serializeNewBook,
    deserialize: deserializeNewBook,
  ),
);

@isarProtected
int serializeNewBook(IsarWriter writer, NewBook object) {
  IsarCore.writeLong(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.title);
  {
    final list = object.authors;
    final listWriter = IsarCore.beginList(writer, 3, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeAuthor(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.translators;
    final listWriter = IsarCore.beginList(writer, 4, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeAuthor(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.subjects;
    final listWriter = IsarCore.beginList(writer, 5, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.bookshelves;
    final listWriter = IsarCore.beginList(writer, 6, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.languages;
    final listWriter = IsarCore.beginList(writer, 7, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeByte(listWriter, i, list[i].index);
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeBool(writer, 8, object.copyright);
  IsarCore.writeByte(writer, 9, object.mediaType.index);
  {
    final value = object.formats;
    if (value == null) {
      IsarCore.writeNull(writer, 10);
    } else {
      final objectWriter = IsarCore.beginObject(writer, 10);
      serializeFormats(objectWriter, value);
      IsarCore.endObject(writer, objectWriter);
    }
  }
  IsarCore.writeLong(writer, 11, object.downloadCount);
  return 0;
}

@isarProtected
NewBook deserializeNewBook(IsarReader reader) {
  final int _id;
  _id = IsarCore.readLong(reader, 1);
  final String _title;
  _title = IsarCore.readString(reader, 2) ?? '';
  final List<Author> _authors;
  {
    final length = IsarCore.readList(reader, 3, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _authors = const <Author>[];
      } else {
        final list = List<Author>.filled(
            length,
            Author(
              name: '',
              birthYear: null,
              deathYear: null,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = Author(
                name: '',
                birthYear: null,
                deathYear: null,
              );
            } else {
              final embedded = deserializeAuthor(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _authors = list;
      }
    }
  }
  final List<Author> _translators;
  {
    final length = IsarCore.readList(reader, 4, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _translators = const <Author>[];
      } else {
        final list = List<Author>.filled(
            length,
            Author(
              name: '',
              birthYear: null,
              deathYear: null,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = Author(
                name: '',
                birthYear: null,
                deathYear: null,
              );
            } else {
              final embedded = deserializeAuthor(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _translators = list;
      }
    }
  }
  final List<String> _subjects;
  {
    final length = IsarCore.readList(reader, 5, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _subjects = const <String>[];
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        _subjects = list;
      }
    }
  }
  final List<String> _bookshelves;
  {
    final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _bookshelves = const <String>[];
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        _bookshelves = list;
      }
    }
  }
  final List<Language> _languages;
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _languages = const <Language>[];
      } else {
        final list = List<Language>.filled(length, Language.EN, growable: true);
        for (var i = 0; i < length; i++) {
          {
            if (IsarCore.readNull(reader, i)) {
              list[i] = Language.EN;
            } else {
              list[i] = _newBookLanguages[IsarCore.readByte(reader, i)] ??
                  Language.EN;
            }
          }
        }
        IsarCore.freeReader(reader);
        _languages = list;
      }
    }
  }
  final bool _copyright;
  _copyright = IsarCore.readBool(reader, 8);
  final MediaType _mediaType;
  {
    if (IsarCore.readNull(reader, 9)) {
      _mediaType = MediaType.TEXT;
    } else {
      _mediaType =
          _newBookMediaType[IsarCore.readByte(reader, 9)] ?? MediaType.TEXT;
    }
  }
  final Formats? _formats;
  {
    final objectReader = IsarCore.readObject(reader, 10);
    if (objectReader.isNull) {
      _formats = null;
    } else {
      final embedded = deserializeFormats(objectReader);
      IsarCore.freeReader(objectReader);
      _formats = embedded;
    }
  }
  final int _downloadCount;
  _downloadCount = IsarCore.readLong(reader, 11);
  final object = NewBook(
    id: _id,
    title: _title,
    authors: _authors,
    translators: _translators,
    subjects: _subjects,
    bookshelves: _bookshelves,
    languages: _languages,
    copyright: _copyright,
    mediaType: _mediaType,
    formats: _formats,
    downloadCount: _downloadCount,
  );
  return object;
}

const _newBookLanguages = {
  0: Language.EN,
};
const _newBookMediaType = {
  0: MediaType.TEXT,
};

extension NewBookQueryFilter
    on QueryBuilder<NewBook, NewBook, QFilterCondition> {
  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      titleGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> authorsIsEmpty() {
    return not().authorsIsNotEmpty();
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> authorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 3, value: null),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> translatorsIsEmpty() {
    return not().translatorsIsNotEmpty();
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      translatorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 4, value: null),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> subjectsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      subjectsElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      subjectsElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> subjectsElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      subjectsElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> subjectsElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      subjectsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> subjectsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> subjectsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> subjectsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      subjectsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      subjectsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> subjectsIsEmpty() {
    return not().subjectsIsNotEmpty();
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> subjectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 5, value: null),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> bookshelvesIsEmpty() {
    return not().bookshelvesIsNotEmpty();
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      bookshelvesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 6, value: null),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> languagesElementEqualTo(
    Language value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      languagesElementGreaterThan(
    Language value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      languagesElementGreaterThanOrEqualTo(
    Language value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      languagesElementLessThan(
    Language value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      languagesElementLessThanOrEqualTo(
    Language value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> languagesElementBetween(
    Language lower,
    Language upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> languagesIsEmpty() {
    return not().languagesIsNotEmpty();
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> languagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> copyrightEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> mediaTypeEqualTo(
    MediaType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> mediaTypeGreaterThan(
    MediaType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      mediaTypeGreaterThanOrEqualTo(
    MediaType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> mediaTypeLessThan(
    MediaType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      mediaTypeLessThanOrEqualTo(
    MediaType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> mediaTypeBetween(
    MediaType lower,
    MediaType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> formatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 10));
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> formatsIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 10));
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> downloadCountEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      downloadCountGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      downloadCountGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> downloadCountLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition>
      downloadCountLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> downloadCountBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 11,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension NewBookQueryObject
    on QueryBuilder<NewBook, NewBook, QFilterCondition> {
  QueryBuilder<NewBook, NewBook, QAfterFilterCondition> formats(
      FilterQuery<Formats> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 10);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const AuthorSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Author',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'birthYear',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'deathYear',
        type: IsarType.long,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, Author>(
    serialize: serializeAuthor,
    deserialize: deserializeAuthor,
  ),
);

@isarProtected
int serializeAuthor(IsarWriter writer, Author object) {
  IsarCore.writeString(writer, 1, object.name);
  IsarCore.writeLong(writer, 2, object.birthYear ?? -9223372036854775808);
  IsarCore.writeLong(writer, 3, object.deathYear ?? -9223372036854775808);
  return 0;
}

@isarProtected
Author deserializeAuthor(IsarReader reader) {
  final String _name;
  _name = IsarCore.readString(reader, 1) ?? '';
  final int? _birthYear;
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      _birthYear = null;
    } else {
      _birthYear = value;
    }
  }
  final int? _deathYear;
  {
    final value = IsarCore.readLong(reader, 3);
    if (value == -9223372036854775808) {
      _deathYear = null;
    } else {
      _deathYear = value;
    }
  }
  final object = Author(
    name: _name,
    birthYear: _birthYear,
    deathYear: _deathYear,
  );
  return object;
}

extension AuthorQueryFilter on QueryBuilder<Author, Author, QFilterCondition> {
  QueryBuilder<Author, Author, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> birthYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> birthYearIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> birthYearEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> birthYearGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition>
      birthYearGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> birthYearLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition>
      birthYearLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> birthYearBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> deathYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> deathYearIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> deathYearEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> deathYearGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition>
      deathYearGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> deathYearLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition>
      deathYearLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Author, Author, QAfterFilterCondition> deathYearBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension AuthorQueryObject on QueryBuilder<Author, Author, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const FormatsSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Formats',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'textHtml',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'applicationEpubZip',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'applicationXMobipocketEbook',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'applicationRdfXml',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'imageJpeg',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'textPlainCharsetUsAscii',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'applicationOctetStream',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'textHtmlCharsetUtf8',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'textPlainCharsetUtf8',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'textPlainCharsetIso88591',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'textHtmlCharsetIso88591',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, Formats>(
    serialize: serializeFormats,
    deserialize: deserializeFormats,
  ),
);

@isarProtected
int serializeFormats(IsarWriter writer, Formats object) {
  IsarCore.writeString(writer, 1, object.textHtml);
  IsarCore.writeString(writer, 2, object.applicationEpubZip);
  IsarCore.writeString(writer, 3, object.applicationXMobipocketEbook);
  IsarCore.writeString(writer, 4, object.applicationRdfXml);
  IsarCore.writeString(writer, 5, object.imageJpeg);
  IsarCore.writeString(writer, 6, object.textPlainCharsetUsAscii);
  IsarCore.writeString(writer, 7, object.applicationOctetStream);
  {
    final value = object.textHtmlCharsetUtf8;
    if (value == null) {
      IsarCore.writeNull(writer, 8);
    } else {
      IsarCore.writeString(writer, 8, value);
    }
  }
  {
    final value = object.textPlainCharsetUtf8;
    if (value == null) {
      IsarCore.writeNull(writer, 9);
    } else {
      IsarCore.writeString(writer, 9, value);
    }
  }
  {
    final value = object.textPlainCharsetIso88591;
    if (value == null) {
      IsarCore.writeNull(writer, 10);
    } else {
      IsarCore.writeString(writer, 10, value);
    }
  }
  {
    final value = object.textHtmlCharsetIso88591;
    if (value == null) {
      IsarCore.writeNull(writer, 11);
    } else {
      IsarCore.writeString(writer, 11, value);
    }
  }
  return 0;
}

@isarProtected
Formats deserializeFormats(IsarReader reader) {
  final String _textHtml;
  _textHtml = IsarCore.readString(reader, 1) ?? '';
  final String _applicationEpubZip;
  _applicationEpubZip = IsarCore.readString(reader, 2) ?? '';
  final String _applicationXMobipocketEbook;
  _applicationXMobipocketEbook = IsarCore.readString(reader, 3) ?? '';
  final String _applicationRdfXml;
  _applicationRdfXml = IsarCore.readString(reader, 4) ?? '';
  final String _imageJpeg;
  _imageJpeg = IsarCore.readString(reader, 5) ?? '';
  final String _textPlainCharsetUsAscii;
  _textPlainCharsetUsAscii = IsarCore.readString(reader, 6) ?? '';
  final String _applicationOctetStream;
  _applicationOctetStream = IsarCore.readString(reader, 7) ?? '';
  final String? _textHtmlCharsetUtf8;
  _textHtmlCharsetUtf8 = IsarCore.readString(reader, 8);
  final String? _textPlainCharsetUtf8;
  _textPlainCharsetUtf8 = IsarCore.readString(reader, 9);
  final String? _textPlainCharsetIso88591;
  _textPlainCharsetIso88591 = IsarCore.readString(reader, 10);
  final String? _textHtmlCharsetIso88591;
  _textHtmlCharsetIso88591 = IsarCore.readString(reader, 11);
  final object = Formats(
    textHtml: _textHtml,
    applicationEpubZip: _applicationEpubZip,
    applicationXMobipocketEbook: _applicationXMobipocketEbook,
    applicationRdfXml: _applicationRdfXml,
    imageJpeg: _imageJpeg,
    textPlainCharsetUsAscii: _textPlainCharsetUsAscii,
    applicationOctetStream: _applicationOctetStream,
    textHtmlCharsetUtf8: _textHtmlCharsetUtf8,
    textPlainCharsetUtf8: _textPlainCharsetUtf8,
    textPlainCharsetIso88591: _textPlainCharsetIso88591,
    textHtmlCharsetIso88591: _textHtmlCharsetIso88591,
  );
  return object;
}

extension FormatsQueryFilter
    on QueryBuilder<Formats, Formats, QFilterCondition> {
  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> textHtmlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationEpubZipIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationXMobipocketEbookIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationRdfXmlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      imageJpegGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      imageJpegLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition> imageJpegIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUsAsciiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 7,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 7,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      applicationOctetStreamIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 7,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 8));
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8IsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 8));
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8GreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8GreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8LessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8LessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8Between(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 8,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 8,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetUtf8IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 8,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 9));
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8IsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 9));
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8GreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8GreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8LessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8LessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8Between(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 9,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 9,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetUtf8IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 9,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 10));
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591IsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 10));
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591GreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591GreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591LessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591LessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591Between(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 10,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591Contains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591Matches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 10,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 10,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textPlainCharsetIso88591IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 10,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 11));
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591IsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 11));
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591GreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591GreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591LessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591LessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591Between(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 11,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591Contains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591Matches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 11,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Formats, Formats, QAfterFilterCondition>
      textHtmlCharsetIso88591IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }
}

extension FormatsQueryObject
    on QueryBuilder<Formats, Formats, QFilterCondition> {}
