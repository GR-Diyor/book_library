// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_search_local_storage.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetNewSearchLocalstorageCollection on Isar {
  IsarCollection<int, NewSearchLocalstorage> get newSearchLocalstorages =>
      this.collection();
}

const NewSearchLocalstorageSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'NewSearchLocalstorage',
    idName: 'list_id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'epubList',
        type: IsarType.objectList,
        target: 'SearchEpubData',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, NewSearchLocalstorage>(
    serialize: serializeNewSearchLocalstorage,
    deserialize: deserializeNewSearchLocalstorage,
    deserializeProperty: deserializeNewSearchLocalstorageProp,
  ),
  embeddedSchemas: [SearchEpubDataSchema],
);

@isarProtected
int serializeNewSearchLocalstorage(
    IsarWriter writer, NewSearchLocalstorage object) {
  {
    final list = object.epubList;
    final listWriter = IsarCore.beginList(writer, 1, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeSearchEpubData(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.list_id;
}

@isarProtected
NewSearchLocalstorage deserializeNewSearchLocalstorage(IsarReader reader) {
  final int _list_id;
  _list_id = IsarCore.readId(reader);
  final List<SearchEpubData> _epubList;
  {
    final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _epubList = const <SearchEpubData>[];
      } else {
        final list = List<SearchEpubData>.filled(
            length,
            SearchEpubData(
              -9223372036854775808,
              '',
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = SearchEpubData(
                -9223372036854775808,
                '',
              );
            } else {
              final embedded = deserializeSearchEpubData(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _epubList = list;
      }
    }
  }
  final object = NewSearchLocalstorage(
    _list_id,
    _epubList,
  );
  return object;
}

@isarProtected
dynamic deserializeNewSearchLocalstorageProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <SearchEpubData>[];
          } else {
            final list = List<SearchEpubData>.filled(
                length,
                SearchEpubData(
                  -9223372036854775808,
                  '',
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = SearchEpubData(
                    -9223372036854775808,
                    '',
                  );
                } else {
                  final embedded = deserializeSearchEpubData(objectReader);
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

extension NewSearchLocalstorageQueryFilter on QueryBuilder<
    NewSearchLocalstorage, NewSearchLocalstorage, QFilterCondition> {
  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage,
      QAfterFilterCondition> list_idEqualTo(
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

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage,
      QAfterFilterCondition> list_idGreaterThan(
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

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage,
      QAfterFilterCondition> list_idGreaterThanOrEqualTo(
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

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage,
      QAfterFilterCondition> list_idLessThan(
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

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage,
      QAfterFilterCondition> list_idLessThanOrEqualTo(
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

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage,
      QAfterFilterCondition> list_idBetween(
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

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage,
      QAfterFilterCondition> epubListIsEmpty() {
    return not().epubListIsNotEmpty();
  }

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage,
      QAfterFilterCondition> epubListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 1, value: null),
      );
    });
  }
}

extension NewSearchLocalstorageQueryObject on QueryBuilder<
    NewSearchLocalstorage, NewSearchLocalstorage, QFilterCondition> {}

extension NewSearchLocalstorageQuerySortBy
    on QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage, QSortBy> {
  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage, QAfterSortBy>
      sortByList_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage, QAfterSortBy>
      sortByList_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }
}

extension NewSearchLocalstorageQuerySortThenBy
    on QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage, QSortThenBy> {
  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage, QAfterSortBy>
      thenByList_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage, QAfterSortBy>
      thenByList_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }
}

extension NewSearchLocalstorageQueryWhereDistinct
    on QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage, QDistinct> {}

extension NewSearchLocalstorageQueryProperty1
    on QueryBuilder<NewSearchLocalstorage, NewSearchLocalstorage, QProperty> {
  QueryBuilder<NewSearchLocalstorage, int, QAfterProperty> list_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<NewSearchLocalstorage, List<SearchEpubData>, QAfterProperty>
      epubListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension NewSearchLocalstorageQueryProperty2<R>
    on QueryBuilder<NewSearchLocalstorage, R, QAfterProperty> {
  QueryBuilder<NewSearchLocalstorage, (R, int), QAfterProperty>
      list_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<NewSearchLocalstorage, (R, List<SearchEpubData>), QAfterProperty>
      epubListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension NewSearchLocalstorageQueryProperty3<R1, R2>
    on QueryBuilder<NewSearchLocalstorage, (R1, R2), QAfterProperty> {
  QueryBuilder<NewSearchLocalstorage, (R1, R2, int), QOperations>
      list_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<NewSearchLocalstorage, (R1, R2, List<SearchEpubData>),
      QOperations> epubListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const SearchEpubDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'SearchEpubData',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'epub_id',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'epub',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, SearchEpubData>(
    serialize: serializeSearchEpubData,
    deserialize: deserializeSearchEpubData,
  ),
);

@isarProtected
int serializeSearchEpubData(IsarWriter writer, SearchEpubData object) {
  IsarCore.writeLong(writer, 1, object.epub_id);
  IsarCore.writeString(writer, 2, object.epub);
  return 0;
}

@isarProtected
SearchEpubData deserializeSearchEpubData(IsarReader reader) {
  final int _epub_id;
  _epub_id = IsarCore.readLong(reader, 1);
  final String _epub;
  _epub = IsarCore.readString(reader, 2) ?? '';
  final object = SearchEpubData(
    _epub_id,
    _epub,
  );
  return object;
}

extension SearchEpubDataQueryFilter
    on QueryBuilder<SearchEpubData, SearchEpubData, QFilterCondition> {
  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epub_idEqualTo(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epub_idGreaterThan(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epub_idGreaterThanOrEqualTo(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epub_idLessThan(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epub_idLessThanOrEqualTo(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epub_idBetween(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubEqualTo(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubGreaterThan(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubGreaterThanOrEqualTo(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubLessThan(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubLessThanOrEqualTo(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubBetween(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubStartsWith(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubEndsWith(
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SearchEpubData, SearchEpubData, QAfterFilterCondition>
      epubIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }
}

extension SearchEpubDataQueryObject
    on QueryBuilder<SearchEpubData, SearchEpubData, QFilterCondition> {}
