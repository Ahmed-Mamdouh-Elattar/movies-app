import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final customCacheManager = CacheManager(
  Config(
    'customCacheKey',
    stalePeriod: const Duration(hours: 8), // تفضل متخزنة 30 يوم
    maxNrOfCacheObjects: 15, // أقصى عدد صور
  ),
);
