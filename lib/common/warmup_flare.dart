import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/flare_cache_asset.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

final flareAssets = {
  "logo": AssetFlare(bundle: rootBundle, name: "assets/anim/logo.flr"),
};

/// Ensure all Flare assets used by this app are cached and ready to
/// be displayed as quickly as possible.
Future<void> warmupFlare() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  Iterable<Future<FlareCacheAsset>> futures =
      flareAssets.values.map((asset) => cachedActor(asset));
  await Future.wait(futures);
}
