// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetLocalStorageCollection on Isar {
  IsarCollection<int, LocalStorage> get localStorages => this.collection();
}

const LocalStorageSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'LocalStorage',
    idName: 'list_id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'epubList',
        type: IsarType.objectList,
        target: 'EpubData',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, LocalStorage>(
    serialize: serializeLocalStorage,
    deserialize: deserializeLocalStorage,
    deserializeProperty: deserializeLocalStorageProp,
  ),
  embeddedSchemas: [EpubDataSchema],
);

@isarProtected
int serializeLocalStorage(IsarWriter writer, LocalStorage object) {
  {
    final list = object.epubList;
    final listWriter = IsarCore.beginList(writer, 1, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeEpubData(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.list_id;
}

@isarProtected
LocalStorage deserializeLocalStorage(IsarReader reader) {
  final int _list_id;
  _list_id = IsarCore.readId(reader);
  final List<EpubData> _epubList;
  {
    final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _epubList = const <EpubData>[];
      } else {
        final list = List<EpubData>.filled(
            length,
            EpubData(
              -9223372036854775808,
              '',
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = EpubData(
                -9223372036854775808,
                '',
              );
            } else {
              final embedded = deserializeEpubData(objectReader);
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
  final object = LocalStorage(
    _list_id,
    _epubList,
  );
  return object;
}

@isarProtected
dynamic deserializeLocalStorageProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <EpubData>[];
          } else {
            final list = List<EpubData>.filled(
                length,
                EpubData(
                  -9223372036854775808,
                  '',
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = EpubData(
                    -9223372036854775808,
                    '',
                  );
                } else {
                  final embedded = deserializeEpubData(objectReader);
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

extension LocalStorageQueryFilter
    on QueryBuilder<LocalStorage, LocalStorage, QFilterCondition> {
  QueryBuilder<LocalStorage, LocalStorage, QAfterFilterCondition>
      list_idEqualTo(
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

  QueryBuilder<LocalStorage, LocalStorage, QAfterFilterCondition>
      list_idGreaterThan(
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

  QueryBuilder<LocalStorage, LocalStorage, QAfterFilterCondition>
      list_idGreaterThanOrEqualTo(
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

  QueryBuilder<LocalStorage, LocalStorage, QAfterFilterCondition>
      list_idLessThan(
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

  QueryBuilder<LocalStorage, LocalStorage, QAfterFilterCondition>
      list_idLessThanOrEqualTo(
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

  QueryBuilder<LocalStorage, LocalStorage, QAfterFilterCondition>
      list_idBetween(
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

  QueryBuilder<LocalStorage, LocalStorage, QAfterFilterCondition>
      epubListIsEmpty() {
    return not().epubListIsNotEmpty();
  }

  QueryBuilder<LocalStorage, LocalStorage, QAfterFilterCondition>
      epubListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 1, value: null),
      );
    });
  }
}

extension LocalStorageQueryObject
    on QueryBuilder<LocalStorage, LocalStorage, QFilterCondition> {}

extension LocalStorageQuerySortBy
    on QueryBuilder<LocalStorage, LocalStorage, QSortBy> {
  QueryBuilder<LocalStorage, LocalStorage, QAfterSortBy> sortByList_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<LocalStorage, LocalStorage, QAfterSortBy> sortByList_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }
}

extension LocalStorageQuerySortThenBy
    on QueryBuilder<LocalStorage, LocalStorage, QSortThenBy> {
  QueryBuilder<LocalStorage, LocalStorage, QAfterSortBy> thenByList_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<LocalStorage, LocalStorage, QAfterSortBy> thenByList_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }
}

extension LocalStorageQueryWhereDistinct
    on QueryBuilder<LocalStorage, LocalStorage, QDistinct> {}

extension LocalStorageQueryProperty1
    on QueryBuilder<LocalStorage, LocalStorage, QProperty> {
  QueryBuilder<LocalStorage, int, QAfterProperty> list_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LocalStorage, List<EpubData>, QAfterProperty>
      epubListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension LocalStorageQueryProperty2<R>
    on QueryBuilder<LocalStorage, R, QAfterProperty> {
  QueryBuilder<LocalStorage, (R, int), QAfterProperty> list_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LocalStorage, (R, List<EpubData>), QAfterProperty>
      epubListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension LocalStorageQueryProperty3<R1, R2>
    on QueryBuilder<LocalStorage, (R1, R2), QAfterProperty> {
  QueryBuilder<LocalStorage, (R1, R2, int), QOperations> list_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LocalStorage, (R1, R2, List<EpubData>), QOperations>
      epubListProperty() {
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

const EpubDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'EpubData',
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
  converter: IsarObjectConverter<void, EpubData>(
    serialize: serializeEpubData,
    deserialize: deserializeEpubData,
  ),
);

@isarProtected
int serializeEpubData(IsarWriter writer, EpubData object) {
  IsarCore.writeLong(writer, 1, object.epub_id);
  IsarCore.writeString(writer, 2, object.epub);
  return 0;
}

@isarProtected
EpubData deserializeEpubData(IsarReader reader) {
  final int _epub_id;
  _epub_id = IsarCore.readLong(reader, 1);
  final String _epub;
  _epub = IsarCore.readString(reader, 2) ?? '';
  final object = EpubData(
    _epub_id,
    _epub,
  );
  return object;
}

extension EpubDataQueryFilter
    on QueryBuilder<EpubData, EpubData, QFilterCondition> {
  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epub_idEqualTo(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epub_idGreaterThan(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition>
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epub_idLessThan(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition>
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epub_idBetween(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubEqualTo(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubGreaterThan(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition>
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubLessThan(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubLessThanOrEqualTo(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubBetween(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubStartsWith(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubEndsWith(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubContains(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubMatches(
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

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<EpubData, EpubData, QAfterFilterCondition> epubIsNotEmpty() {
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

extension EpubDataQueryObject
    on QueryBuilder<EpubData, EpubData, QFilterCondition> {}
