part of utils;

class ImageUtil {
  // static Future<List<File>> convertAssetsEntity2Files({
  //   required List<AssetEntity> assetsEntity,
  // }) async {
  //   final RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

  //   final rawData = <String, dynamic>{
  //     'root_token': rootIsolateToken,
  //     'assets_entity': assetsEntity,
  //   };
  //   final files = await compute<Map<String, dynamic>, List<File>>(
  //     _assetsEntity2FilesIsolate,
  //     rawData,
  //   );
  //   return files;
  // }

  // static Future<List<File>> _assetsEntity2FilesIsolate(
  //   Map<String, dynamic> dataRaw,
  // ) async {
  //   final rootIsolateToken = dataRaw['root_token'] as RootIsolateToken?;
  //   final assetEntity = dataRaw['assets_entity'] as List<AssetEntity>?;
  //   if (rootIsolateToken == null || assetEntity == null) {
  //     throw Exception("image_path or output_path can't null");
  //   }

  //   BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  //   final List<File> files = [];
  //   for (final asset in assetEntity) {
  //     if (asset.isLivePhoto) {
  //       final File? file = await asset.file;
  //       if (file?.existsSync() ?? false) {
  //         files.add(file!);
  //       }
  //     } else {
  //       final File? file = await asset.originFile;
  //       if (file?.existsSync() ?? false) {
  //         files.add(file!);
  //       }
  //     }
  //   }
  //   return files;
  // }

  // static Future<File> convertAny2JPG({
  //   required String imagePath,
  //   required String outputPath,
  // }) async {
  //   final RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

  //   final paths = {
  //     'root_token': rootIsolateToken,
  //     'image_path': imagePath,
  //     'output_path': outputPath,
  //   };
  //   return compute<Map<String, dynamic>, File>(
  //     _any2JPGIsolate,
  //     paths,
  //   );
  // }

  // static Future<File> _any2JPGIsolate(Map<String, dynamic> paths) async {
  // final rootIsolateToken = paths['root_token'] as RootIsolateToken?;
  // final imagePath = paths['image_path'] as String?;
  // final outputPath = paths['output_path'] as String?;

  // if (rootIsolateToken == null || imagePath == null || outputPath == null) {
  //   throw Exception("image_path or output_path can't null");
  // }

  // BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

  // final dataConvert = await imageConvert(
  //   File(imagePath).readAsBytesSync(), // <-- Uint8List/path of image
  // );

  // return File(outputPath).writeAsBytes(dataConvert);
  // final String ext = _getExt(imagePath);
  //
  // if (ext.contains('jpg') || ext.contains('jpeg')) return File(imagePath);
  //
  // if (ext.contains('heic') || ext.contains('heif')) {
  //   return _heic2JPGIsolate(imagePath, outputPath);
  // }
  //
  // if (ext.contains('gif')) {
  //   return _default2JPGIsolate(imagePath, outputPath, frame: 0);
  // }
  //
  // return _default2JPGIsolate(imagePath, outputPath);
  // }

  // static Future<File?> _default2JPGIsolate(String imagePath, String outputPath,
  //     {int? frame}) async {
  //   final Uint8List inputBytes = File(imagePath).readAsBytesSync();
  //
  //   final Image? image = decodeImage(inputBytes, frame: frame);
  //
  //   if (image == null) return null;
  //
  //   File(outputPath).writeAsBytesSync(encodeJpg(image));
  //
  //   return File(outputPath);
  // }
  //
  // static Future<File?> _heic2JPGIsolate(
  //   String imagePath,
  //   String outputPath,
  // ) async {
  //   final String? jpgPath = await HeifConverter.convert(
  //     imagePath,
  //     output: outputPath,
  //   );
  //
  //   if (jpgPath == null) return null;
  //
  //   return File(jpgPath);
  // }

  // static Future<File?> _gif2JPGIsolate(
  //   String imagePath,
  //   String outputPath,
  // ) async {
  //   final Uint8List inputBytes = File(imagePath).readAsBytesSync();
  //
  //   final Image? image = decodeGif(inputBytes, frame: 0);
  //
  //   if (image == null) return null;
  //
  //   File(outputPath).writeAsBytesSync(encodeJpg(image));
  //
  //   return File(outputPath);
  // }

  // static String _getExt(String path) {
  //   final index = path.lastIndexOf('.');
  //   if (index < 0 || index + 1 >= path.length) return path;
  //   return path.substring(index + 1).toLowerCase();
  // }

  // static Future<Uint8List> imageConvert(
  //   dynamic image, {
  //   String format = 'jpeg',
  //   int quality = 80,
  //   int? height,
  //   int? width,
  //   bool preserveExif = true,
  // }) async {
  //   const formatMap = <String, CompressFormat>{
  //     'jpeg': CompressFormat.jpeg,
  //     'heic': CompressFormat.heic,
  //     'png': CompressFormat.png,
  //     'webp': CompressFormat.webp,
  //   };

  //   if (!formatMap.containsKey(format)) {
  //     throw Exception('Output format not supported by library.');
  //   }

  //   if (image is Uint8List) {
  //     final output = await FlutterImageCompress.compressWithList(
  //       image,
  //       quality: quality,
  //       format: formatMap[format]!,
  //       minHeight: height ?? 1080,
  //       minWidth: width ?? 1920,
  //       keepExif: preserveExif,
  //     );

  //     return output;
  //   } else if (image is String) {
  //     final output = await FlutterImageCompress.compressWithFile(
  //       image,
  //       quality: quality,
  //       format: formatMap[format]!,
  //       minHeight: height ?? 1080,
  //       minWidth: width ?? 1920,
  //       keepExif: preserveExif,
  //     );

  //     if (output == null) {
  //       throw Exception('Unable to compress image file');
  //     }

  //     return output;
  //   } else {
  //     throw Exception('Image must be a Uint8List or path.');
  //   }
  // }
}
