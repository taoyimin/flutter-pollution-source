// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_inspection_upload_factor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineInspectionUploadFactor _$RoutineInspectionUploadFactorFromJson(
    Map<String, dynamic> json) {
  return RoutineInspectionUploadFactor(
      factorId: json['Factor_Id'] as int,
      factorCode: json['Factor_Code'] as String,
      factorName: json['Factor_Name'] as String,
      unit: json['Unit'] as String,
      measureRange: json['Standar_Value'] as String,
      measureUpper: json['measure_Upper'],
      measureLower: json['measure_Lower']);
}

Map<String, dynamic> _$RoutineInspectionUploadFactorToJson(
        RoutineInspectionUploadFactor instance) =>
    <String, dynamic>{
      'Factor_Id': instance.factorId,
      'Factor_Code': instance.factorCode,
      'Factor_Name': instance.factorName,
      'Unit': instance.unit,
      'Standar_Value': instance.measureRange,
      'measure_Upper': instance.measureUpper,
      'measure_Lower': instance.measureLower
    };
