import 'package:freezed_annotation/freezed_annotation.dart';

part 'file.freezed.dart';
part 'file.g.dart';

@freezed
class File with _$File {
  const factory File({
    String? fileId,
    String? name,
    String? url,
    int? size,
    String? mimeType,
    int? createAt,
  }) = _File;
  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
}
