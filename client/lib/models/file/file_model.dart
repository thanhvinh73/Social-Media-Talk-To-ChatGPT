import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/services/public_api.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
class FileModel with _$FileModel {
  const factory FileModel({
    String? fileId,
    String? name,
    String? url,
    int? size,
    String? mimeType,
    int? createAt,
  }) = _FileModel;
  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}

extension FileModelExt on FileModel? {
  String get getFileUrl =>
      "${PublicApi.baseUrl}/api/files/${this?.fileId ?? ""}";
}
