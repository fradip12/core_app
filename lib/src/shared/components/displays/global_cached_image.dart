import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../assets/assets.gen.dart';
import '../../extensions/ext_dimens.dart';
import '../../extensions/ext_misc.dart';

class GlobalCacheImage extends StatelessWidget {
  final String? image;
  final double? size;
  final BoxFit? fit;
  const GlobalCacheImage({
    super.key,
    this.image,
    this.size,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image.orDefault,
      width: size ?? context.spacingXxlg,
      height: size ?? context.spacingXxlg,
      // placeholder: (_, __) => const GlobalCustomShimmer(),
      errorWidget: (_, __, ___) {
        return Assets.images.imgDefault.image(fit: BoxFit.cover);
      },
      fit: fit,
    ).animated;
  }
}
