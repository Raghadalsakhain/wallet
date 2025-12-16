// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category_model.dart';

class CategoryModelMapper extends ClassMapperBase<CategoryModel> {
  CategoryModelMapper._();

  static CategoryModelMapper? _instance;
  static CategoryModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryModel';

  static String _$user_id(CategoryModel v) => v.user_id;
  static const Field<CategoryModel, String> _f$user_id = Field(
    'user_id',
    _$user_id,
  );
  static String _$categoryname(CategoryModel v) => v.categoryname;
  static const Field<CategoryModel, String> _f$categoryname = Field(
    'categoryname',
    _$categoryname,
  );
  static double? _$amount(CategoryModel v) => v.amount;
  static const Field<CategoryModel, double> _f$amount = Field(
    'amount',
    _$amount,
  );
  static String _$logo(CategoryModel v) => v.logo;
  static const Field<CategoryModel, String> _f$logo = Field('logo', _$logo);
  static Color _$categoryColor(CategoryModel v) => v.categoryColor;
  static const Field<CategoryModel, Color> _f$categoryColor = Field(
    'categoryColor',
    _$categoryColor,
  );

  @override
  final MappableFields<CategoryModel> fields = const {
    #user_id: _f$user_id,
    #categoryname: _f$categoryname,
    #amount: _f$amount,
    #logo: _f$logo,
    #categoryColor: _f$categoryColor,
  };

  static CategoryModel _instantiate(DecodingData data) {
    return CategoryModel(
      user_id: data.dec(_f$user_id),
      categoryname: data.dec(_f$categoryname),
      amount: data.dec(_f$amount),
      logo: data.dec(_f$logo),
      categoryColor: data.dec(_f$categoryColor),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryModel>(map);
  }

  static CategoryModel fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryModel>(json);
  }
}

mixin CategoryModelMappable {
  String toJson() {
    return CategoryModelMapper.ensureInitialized().encodeJson<CategoryModel>(
      this as CategoryModel,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryModelMapper.ensureInitialized().encodeMap<CategoryModel>(
      this as CategoryModel,
    );
  }

  CategoryModelCopyWith<CategoryModel, CategoryModel, CategoryModel>
  get copyWith => _CategoryModelCopyWithImpl<CategoryModel, CategoryModel>(
    this as CategoryModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CategoryModelMapper.ensureInitialized().stringifyValue(
      this as CategoryModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryModelMapper.ensureInitialized().equalsValue(
      this as CategoryModel,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryModelMapper.ensureInitialized().hashValue(
      this as CategoryModel,
    );
  }
}

extension CategoryModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryModel, $Out> {
  CategoryModelCopyWith<$R, CategoryModel, $Out> get $asCategoryModel =>
      $base.as((v, t, t2) => _CategoryModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryModelCopyWith<$R, $In extends CategoryModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? user_id,
    String? categoryname,
    double? amount,
    String? logo,
    Color? categoryColor,
  });
  CategoryModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryModel, $Out>
    implements CategoryModelCopyWith<$R, CategoryModel, $Out> {
  _CategoryModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryModel> $mapper =
      CategoryModelMapper.ensureInitialized();
  @override
  $R call({
    String? user_id,
    String? categoryname,
    Object? amount = $none,
    String? logo,
    Color? categoryColor,
  }) => $apply(
    FieldCopyWithData({
      if (user_id != null) #user_id: user_id,
      if (categoryname != null) #categoryname: categoryname,
      if (amount != $none) #amount: amount,
      if (logo != null) #logo: logo,
      if (categoryColor != null) #categoryColor: categoryColor,
    }),
  );
  @override
  CategoryModel $make(CopyWithData data) => CategoryModel(
    user_id: data.get(#user_id, or: $value.user_id),
    categoryname: data.get(#categoryname, or: $value.categoryname),
    amount: data.get(#amount, or: $value.amount),
    logo: data.get(#logo, or: $value.logo),
    categoryColor: data.get(#categoryColor, or: $value.categoryColor),
  );

  @override
  CategoryModelCopyWith<$R2, CategoryModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

