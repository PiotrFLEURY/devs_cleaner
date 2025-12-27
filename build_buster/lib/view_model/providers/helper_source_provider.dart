import 'package:build_buster/model/sources/helper_source.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'helper_source_provider.g.dart';

@riverpod
HelperSource helperSource(Ref ref) {
  // You might want to configure Dio here if needed
  final dio = Dio();
  return HelperSource(dio);
}
