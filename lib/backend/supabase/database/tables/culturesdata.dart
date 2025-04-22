import '../database.dart';

class CulturesdataTable extends SupabaseTable<CulturesdataRow> {
  @override
  String get tableName => 'Culturesdata';

  @override
  CulturesdataRow createRow(Map<String, dynamic> data) => CulturesdataRow(data);
}

class CulturesdataRow extends SupabaseDataRow {
  CulturesdataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CulturesdataTable();

  int get culindex => getField<int>('culindex')!;
  set culindex(int value) => setField<int>('culindex', value);

  String? get cULname => getField<String>('CULname');
  set cULname(String? value) => setField<String>('CULname', value);

  String? get culhistory => getField<String>('culhistory');
  set culhistory(String? value) => setField<String>('culhistory', value);

  String? get culactivities => getField<String>('culactivities');
  set culactivities(String? value) => setField<String>('culactivities', value);

  String? get culimgssurl => getField<String>('culimgssurl');
  set culimgssurl(String? value) => setField<String>('culimgssurl', value);

  String? get culimgurl => getField<String>('culimgurl');
  set culimgurl(String? value) => setField<String>('culimgurl', value);

  String? get youtubeLinks => getField<String>('YoutubeLinks');
  set youtubeLinks(String? value) => setField<String>('YoutubeLinks', value);
}
