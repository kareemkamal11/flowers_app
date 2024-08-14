import 'dart:io';

void main() {
  final directory = Directory('assets');
  final pubspecFile = File('pubspec.yaml');
  final coreDirectory = Directory('lib/core');
  final assetsUtilFile = File('lib/core/assets_util.dart');

  // Ensure core directory exists
  if (!coreDirectory.existsSync()) {
    coreDirectory.createSync(recursive: true);
    print('Created core directory');
  }

  // Ensure assets_util.dart file exists
  if (!assetsUtilFile.existsSync()) {
    assetsUtilFile.writeAsStringSync('class AssetsUtil {\n}\n');
    print('Created assets_util.dart file');
  }

  if (directory.existsSync() && pubspecFile.existsSync()) {
    final files = directory.listSync(recursive: true);
    final paths = <String>[];

    for (var file in files) {
      if (file is File) {
        paths.add(file.path.replaceAll('\\', '/'));
      }
    }

    final pubspecContent = pubspecFile.readAsStringSync();
    final updatedPubspecContent = updatePubspecContent(pubspecContent, paths);
    pubspecFile.writeAsStringSync(updatedPubspecContent);

    final assetsUtilContent = assetsUtilFile.readAsStringSync();
    final updatedAssetsUtilContent = updateAssetsUtilContent(assetsUtilContent, paths);
    assetsUtilFile.writeAsStringSync(updatedAssetsUtilContent);

    print('Assets paths have been added to pubspec.yaml and assets_util.dart');
  } else {
    print('Directory or pubspec.yaml does not exist');
  }
}

String updatePubspecContent(String content, List<String> paths) {
  final buffer = StringBuffer();
  final lines = content.split('\n');
  bool inAssetsSection = false;
  final existingPaths = <String>{};

  for (var line in lines) {
    if (line.trim().startsWith('assets:')) {
      inAssetsSection = true;
      buffer.writeln(line);
    } else if (inAssetsSection && line.trim().startsWith('-')) {
      existingPaths.add(line.trim().substring(2).trim());
      buffer.writeln(line);
    } else if (inAssetsSection && line.trim().isEmpty) {
      inAssetsSection = false;
      buffer.writeln(line);
    } else {
      buffer.writeln(line);
    }
  }

  for (var path in paths) {
    if (!existingPaths.contains(path)) {
      buffer.writeln('    - $path');
    }
  }

  return buffer.toString();
}

String updateAssetsUtilContent(String content, List<String> paths) {
  final buffer = StringBuffer();
  final lines = content.split('\n');
  final existingVariables = <String>{};
  bool inClassSection = false;

  for (var line in lines) {
    if (line.trim().startsWith('class AssetsUtil')) {
      inClassSection = true;
      buffer.writeln(line);
    } else if (inClassSection && line.trim().startsWith('static const String')) {
      final variableName = line.split(' ')[3];
      existingVariables.add(variableName);
      buffer.writeln(line);
    } else if (inClassSection && line.trim() == '}') {
      for (var path in paths) {
        final fileName = path.split('/').last.split('.').first;
        final variableName = fileName.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
        if (!existingVariables.contains(variableName)) {
          buffer.writeln('  static const String $variableName = \'$path\';');
        }
      }
      buffer.writeln(line);
      inClassSection = false;
    } else {
      buffer.writeln(line);
    }
  }

  return buffer.toString();
}