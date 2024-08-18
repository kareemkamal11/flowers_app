import 'dart:io'; // يعني استدعاء مكتبة الادخال والاخراج

void main() {

  // Directory و File هما مكتبتان تستخدمان للتعامل مع الملفات والمجلدات في النظام

  final directory = Directory('assets'); // يعني استدعاء المجلد الذي يحتوي على الملفات
  final pubspecFile = File('pubspec.yaml'); // يعني استدعاء ملف الببسبيك الذي يحتوي على الاعدادات
  final coreDirectory = Directory('lib/core'); // يعني استدعاء المجلد الذي يحتوي على الملفات الاساسية
  final assetsUtilFile = File('lib/core/assets_util.dart'); // يعني استدعاء ملف الادخال والاخراج

  // Ensure core directory exists
  if (!coreDirectory.existsSync()) { // يعني اذا لم يكن المجلد موجود
    coreDirectory.createSync(recursive: true); // يعني انشاء المجلد
    print('Created core directory');
  }

  // Ensure assets_util.dart file exists
  if (!assetsUtilFile.existsSync()) { // يعني اذا لم يكن الملف موجود
    assetsUtilFile.writeAsStringSync('class AssetsUtil {\n}\n'); // يعني انشاء الملف وكتابة النص 
    // writeAsStringSync يعني كتابة النص في الملف
    print('Created assets_util.dart file');
  }

  if (directory.existsSync() && pubspecFile.existsSync()) { // يعني اذا كان المجلد والملف موجودين 
    final files = directory.listSync(recursive: true); // يعني استدعاء الملفات الموجودة في المجلد
    // listSync يعني استدعاء قائمة الملفات الموجودة في المجلد recursive: true يعني استدعاء الملفات الموجودة في المجلد الابن
    final paths = <String>[]; // يعني انشاء قائمة للمسارات في الملفات

    for (var file in files) { // يعني الدوران على الملفات 
      if (file is File) { // يعني اذا كان الملف هو ملف 
        paths.add(file.path.replaceAll('\\', '/')); // يعني اضافة المسار الى قائمة المسارات واستبدال الشرطة المائلة بالشرطة المائلة العكسية
      }
    }

    final pubspecContent = pubspecFile.readAsStringSync(); // يعني قراءة محتوى الملف 
    final updatedPubspecContent = updatePubspecContent(pubspecContent, paths); // يعني تحديث محتوى الملف
    pubspecFile.writeAsStringSync(updatedPubspecContent); // يعني كتابة المحتوى في الملف

    final assetsUtilContent = assetsUtilFile.readAsStringSync(); // يعني قراءة محتوى الملف
    final updatedAssetsUtilContent = updateAssetsUtilContent(assetsUtilContent, paths); // يعني تحديث محتوى الملف
    assetsUtilFile.writeAsStringSync(updatedAssetsUtilContent); // يعني كتابة المحتوى في الملف

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