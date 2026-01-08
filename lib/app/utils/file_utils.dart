part of utils;

extension FileExt on File {
  String getFileTypeExt() {
    final names = path.split('.');
    return names.last;
  }
}

// bool isFileTypeSupported(String? mimeType) {
//   if (mimeType == null) return false;

//   if (!mimeType.contains(FileType.image.val) &&
//       !mimeType.contains(FileType.video.val)) {
//     return false;
//   }
//   return true;
// }

// Future<(num, num)> getImageSize(XFile? file) async {
//   if (file == null) return (0, 0);

//   final bytes = await file.readAsBytes();
//   final kb = bytes.lengthInBytes / 1024;
//   final mb = kb / 1024;

//   return (kb, mb);
// }

Future<File> changeFileNameOnly(File file, String newFileName) {
  final path = file.path;
  final lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  final newPath = path.substring(0, lastSeparator + 1) + newFileName;
  return file.copy(newPath);
}

const String folderCacheName = 'media_editer_cache';
const String folderCacheThumbnailName = 'media_thumbnail_cache';

Future<String> createPathDirectoryCache() async {
  final Directory? tempDir;
  if (Platform.isAndroid) {
    tempDir = await path_store.getExternalStorageDirectory();
  } else {
    tempDir = await path_store.getTemporaryDirectory();
  }
  final String pathFolder = '${tempDir?.path}/$folderCacheName';
  if (!Directory(pathFolder).existsSync()) {
    await Directory(pathFolder).create(recursive: true);
  }
  return pathFolder;
}

Future<void> deletePathDirectoryCache() async {
  final Directory? tempDir;
  if (Platform.isAndroid) {
    tempDir = await path_store.getExternalStorageDirectory();
  } else {
    tempDir = await path_store.getTemporaryDirectory();
  }
  final String pathFolder = '${tempDir?.path}/$folderCacheName';
  if (Directory(pathFolder).existsSync()) {
    await Directory(pathFolder).delete(recursive: true);
  }
}

Future<String> getPathDirectoryCacheFile({String keyName = ''}) async {
  final String pathFolder = await createPathDirectoryCache();
  if (keyName.isEmpty) {
    return pathFolder;
  } else {
    return '$pathFolder/$keyName';
  }
}

// Future<void> exportVideo(
//   MediaVideoDataDTO dto,
//   void Function(int percent) percentLoad,
//   void Function(File result) onSuccess,
//   void Function() onFailure,
// ) async {
//   // File? result;
//   final int videoDuration = dto.videoDuration;
//   final bool isSuccess = await ExportService.ffmpegKitRun(dto.ffmpegCommandVideo, videoDuration, percentLoad);
//   if (isSuccess) {
//     onSuccess(File(dto.outPut));
//   } else {
//     onFailure();
//   }
// }

// Future<File> exportCover(String ffmpegCommand, String videoId) async {
//   final pathFile = await getPathDirectoryCacheFile(keyName: videoId);
//   final outputPath = '${pathFile}_thumbnail.jpeg';
//   final bool isSuccess = await ExportService.ffmpegKitRun(ffmpegCommand);
//   if (isSuccess) {
//     return File(outputPath);
//   } else {}
//   return File('');
// }

// Future<(File, List<ImageDataDto>)> compressAndZipFile(
//   List<File> images,
//   String fileKey, [
//   void Function(ImageDataDto imagedto, int index, String filePath)? onAddToZip,
//   void Function(File zip)? onSuccess,
// ]) async {
//   final String pathZip =
//       '${await getPathDirectoryCacheFile(keyName: fileKey)}.zip';
//   final String cachePath = await getPathDirectoryCacheFile();
//   final List<ImageDataDto> imagesDataDto = [];
//   final encoder = ZipFileEncoder()..create(pathZip);
//   for (var i = 0; i < images.length; i++) {
//     final String fileName = '${fileKey}_$i';
//     final File? newFile = await compressFileAssetImage(
//       images[i],
//       fileName,
//       cachePath,
//     );
//     if (newFile != null) {
//       final ImageDataDto imageDataDto = ImageDataDto(
//         fileName: '$fileName.jpeg',
//         caption: '',
//       );
//       imagesDataDto.add(imageDataDto);
//       onAddToZip?.call(imageDataDto, i, newFile.path);
//       encoder.addFile(newFile);
//     }
//   }
//   encoder.close();
//   onSuccess?.call(File(pathZip));
//   return (File(pathZip), imagesDataDto);
// }

// Future<File?> compressFileAssetImage(
//   File images,
//   String fileName,
//   String targetPath,
// ) async {
//   final convertedImage = await ImageUtil.convertAny2JPG(
//     imagePath: images.path,
//     outputPath: '$targetPath/$fileName.jpeg', // <-- Uint8List/path of image
//   );
//   return convertedImage;
  // final dataExif = await readExifFromFile(originImg);
  //
  // final imgConverted = await ImageUtil.convertAny2JPG(
  //   imagePath: originImg.path,
  //   outputPath: '$targetPath/$fileName-C.jpeg',
  // );
  // if (imgConverted == null || !imgConverted.existsSync()) return originImg;
  // int rotate = 0;
  // if (!dataExif['Image Orientation'].isNullOrEmpty) {
  //   final String rotateStr = (dataExif['Image Orientation'] ?? '')
  //       .toString()
  //       .replaceAll(RegExp('[^0-9]'), ''); // '23'
  //   if (rotateStr.isNotEmpty) {
  //     rotate = int.parse(rotateStr);
  //   }
  // }
  // final dataExifAfterConvert = await readExifFromFile(File(imgConverted.path));
  // if (!dataExifAfterConvert['Image Orientation'].isNullOrEmpty && rotate != 0) {
  //   rotate = 0;
  // }
  //
  // final XFile? imgCompressed = await FlutterImageCompress.compressAndGetFile(
  //     rotate: rotate,
  //     imgConverted.path,
  //     '$targetPath/$fileName.jpeg',
  //     quality: 88,
  //     keepExif: true);
  //
  // if (imgCompressed == null || !File(imgCompressed.path).existsSync()) {
  //   return null;
  // }
  //
  // return File(imgCompressed.path);
// }

// Future<File?> getFileFromAssetEntityFile(AssetEntity asset) async {
//   if (asset.isLivePhoto) {
//     final File? file = await asset.file;
//     if (file?.existsSync() ?? false) {
//       return file;
//     }
//   } else {
//     final File? file = await asset.originFile;
//     if (file?.existsSync() ?? false) {
//       return file;
//     }
//   }
//   return null;
// }
