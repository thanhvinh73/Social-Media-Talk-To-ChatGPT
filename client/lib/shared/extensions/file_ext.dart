import 'dart:io';

extension FileExt on File {
  String get name => path.split(Platform.pathSeparator).last;
}
