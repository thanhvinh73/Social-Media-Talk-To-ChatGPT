import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_with_chatgpt/shared/extensions/list_ext.dart';

import '../../models/meta/meta.dart';

part 'api_list.freezed.dart';
part 'api_list.g.dart';

@Freezed(
  genericArgumentFactories: true,
)
class ApiList<T> with _$ApiList<T> {
  factory ApiList(
    String? status,
    List<T>? data,
    Meta? meta,
  ) = _ApiList<T>;

  factory ApiList.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiListFromJson(json, fromJsonT);
}

extension ApiListExt<T> on ApiList<T>? {
  ApiList<T> insertPage(ApiList<T> newList,
      {String Function(T)? removeDupplicate}) {
    if (this?.meta?.currentPage == 1) {
      return newList;
    } else if (removeDupplicate != null) {
      return ApiList(
          this?.status,
          <String, T>{
            for (var element in [...(this?.data ?? []), newList.data])
              removeDupplicate(element): element
          }.values.toList(),
          newList.meta);
    }
    return ApiList<T>(this?.status,
        [...(this?.data ?? []), ...(newList.data ?? [])], newList.meta);
  }

  ApiList<T> insertLast(T newElement) {
    return ApiList(
        this?.status,
        [...(this?.data ?? []), newElement],
        (this?.meta ?? const Meta(currentPage: 1, totalCount: 0, totalPages: 1))
            .copyWith(totalCount: (this?.meta?.totalCount ?? 0) + 1));
  }

  ApiList<T> insertFirst(T newElement) {
    return ApiList(
      this?.status,
      [newElement, ...(this?.data ?? [])],
      (this?.meta ?? const Meta(currentPage: 1, totalCount: 0, totalPages: 1))
          .copyWith(totalCount: (this?.meta?.totalCount ?? 0) + 1),
    );
  }

  ApiList<T> update(T Function(T) dataUpdate, bool Function(T) condition) {
    return ApiList(
      this?.status,
      (this?.data ?? []).map((element) {
        if (condition(element)) return dataUpdate(element);
        return element;
      }).toList(),
      this?.meta,
    );
  }

  ApiList<T> remove(bool Function(T) condition) {
    return ApiList(
        this?.status,
        (this?.data ?? []).where((element) => !condition(element)).toList(),
        (this?.meta ?? const Meta(currentPage: 1, totalCount: 1, totalPages: 1))
            .copyWith(totalCount: (this?.meta?.totalCount ?? 1) - 1));
  }

  bool get isNullOrEmpty => this == null || this!.data.isNullOrEmpty;
  bool get isNotNullOrEmpty => this != null && this!.data.isNotNullOrEmpty;
}
