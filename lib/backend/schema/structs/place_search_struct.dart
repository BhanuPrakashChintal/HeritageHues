// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceSearchStruct extends BaseStruct {
  PlaceSearchStruct({
    int? id,
    List<String>? name,
    List<String>? location,
    List<int>? rating,
  })  : _id = id,
        _name = name,
        _location = location,
        _rating = rating;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  set name(List<String>? val) => _name = val;

  void updateName(Function(List<String>) updateFn) {
    updateFn(_name ??= []);
  }

  bool hasName() => _name != null;

  // "Location" field.
  List<String>? _location;
  List<String> get location => _location ?? const [];
  set location(List<String>? val) => _location = val;

  void updateLocation(Function(List<String>) updateFn) {
    updateFn(_location ??= []);
  }

  bool hasLocation() => _location != null;

  // "Rating" field.
  List<int>? _rating;
  List<int> get rating => _rating ?? const [];
  set rating(List<int>? val) => _rating = val;

  void updateRating(Function(List<int>) updateFn) {
    updateFn(_rating ??= []);
  }

  bool hasRating() => _rating != null;

  static PlaceSearchStruct fromMap(Map<String, dynamic> data) =>
      PlaceSearchStruct(
        id: castToType<int>(data['id']),
        name: getDataList(data['Name']),
        location: getDataList(data['Location']),
        rating: getDataList(data['Rating']),
      );

  static PlaceSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'Name': _name,
        'Location': _location,
        'Rating': _rating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
          isList: true,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
          isList: true,
        ),
        'Rating': serializeParam(
          _rating,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static PlaceSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceSearchStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam<String>(
          data['Name'],
          ParamType.String,
          true,
        ),
        location: deserializeParam<String>(
          data['Location'],
          ParamType.String,
          true,
        ),
        rating: deserializeParam<int>(
          data['Rating'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'PlaceSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlaceSearchStruct &&
        id == other.id &&
        listEquality.equals(name, other.name) &&
        listEquality.equals(location, other.location) &&
        listEquality.equals(rating, other.rating);
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, location, rating]);
}

PlaceSearchStruct createPlaceSearchStruct({
  int? id,
}) =>
    PlaceSearchStruct(
      id: id,
    );
