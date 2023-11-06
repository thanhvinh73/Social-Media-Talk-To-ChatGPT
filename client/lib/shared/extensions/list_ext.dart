extension ListExt<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isOnlyEmpty => this != null && this!.isEmpty;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  List<T> addNewElement(T data, {bool Function(T element)? removeDuplicate}) {
    int isDuplicate = (removeDuplicate != null)
        ? (this ?? []).indexWhere((element) => removeDuplicate(element))
        : -1;

    return isDuplicate < 0 ? [...(this ?? []), data] : [...(this ?? [])];
  }

  List<T> addFirst(T data, {bool Function(T element)? removeDuplicate}) {
    int isDuplicate = (removeDuplicate != null)
        ? (this ?? []).indexWhere((element) => removeDuplicate(element))
        : -1;
    return isDuplicate < 0 ? [data, ...(this ?? [])] : [...(this ?? [])];
  }

  List<T> addList(List<T> newList) {
    return [...(this ?? []), ...newList];
  }

  List<T> update(T Function(T item) onUpdate, bool Function(T item) condition) {
    return <T>[...(this ?? [])].map((e) {
      if (condition(e)) {
        return onUpdate(e);
      }
      return e;
    }).toList();
  }

  List<T> removeElement(bool Function(T item) condition) {
    return <T>[...(this ?? [])].where((e) => !condition(e)).toList();
  }

  List<T> swap(int firstIndex, int secondIndex) {
    if (this == null ||
        (firstIndex < 0 || secondIndex < 0) ||
        (firstIndex >= (this?.length ?? 0) ||
            secondIndex >= (this?.length ?? 0))) {
      return [...(this ?? [])];
    }
    List<T> copyList = [...this!];
    final temp = copyList[firstIndex];
    copyList[firstIndex] = copyList[secondIndex];
    copyList[secondIndex] = temp;
    return copyList;
  }

  List<T> changePosition(int firstIndex, int secondIndex) {
    if (this == null ||
        (firstIndex < 0 || secondIndex < 0) ||
        (firstIndex >= (this?.length ?? 0) ||
            secondIndex >= (this?.length ?? 0))) {
      return [...(this ?? [])];
    }
    List<T> copyList = [...this!];
    if (firstIndex < secondIndex) {
      int i = firstIndex;
      while (i <= secondIndex - 1) {
        copyList[i] = copyList[i + 1];
        i++;
      }
      copyList[secondIndex] = this![firstIndex];
    } else if (firstIndex > secondIndex) {
      int i = firstIndex;
      while (i >= secondIndex + 1) {
        copyList[i] = copyList[i - 1];
        i--;
      }
      copyList[secondIndex] = this![firstIndex];
    }

    return copyList;
  }
}
