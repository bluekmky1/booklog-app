import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/routes.dart';
import '../../../service/app/app_service.dart';
import '../../../service/app/app_state.dart';
import '../../../theme/booklog_colors.dart';
import '../../../theme/typographies.dart';

class ReverseRoundedAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const ReverseRoundedAppBar({
    super.key,
  });

  @override
  ConsumerState<ReverseRoundedAppBar> createState() =>
      _ReverseRoundedAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(44);
}

class _ReverseRoundedAppBarState extends ConsumerState<ReverseRoundedAppBar> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    final AppState appState = ref.watch(appServiceProvider);

    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Text(
          'Booklog',
          style: Typo.st32r.copyWith(
            color: BooklogColors.white,
            fontFamily: 'ROCK',
            fontSize: 16,
          ),
        ),
      ),
      actions: <Widget>[
        if (appState.isSignedIn)
          GestureDetector(
            onTap: () {
              _showOverlay(
                context: context,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: CompositedTransformTarget(
                link: _layerLink,
                child: Text(
                  '홍길동 님',
                  style: Typo.c12r.copyWith(color: BooklogColors.white),
                ),
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              onTap: () {
                context.goNamed(Routes.signIn.name);
              },
              child: Text(
                '로그인',
                style: Typo.c12r.copyWith(
                  color: BooklogColors.white,
                ),
              ),
            ),
          )
      ],
    );
  }

  void _showOverlay({required BuildContext context}) {
    final OverlayState overlay = Overlay.of(context);
    final OverlayEntry overlayEntry = OverlayEntry(
      maintainState: true,
      builder: (BuildContext context) => Positioned(
        width: 56,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(-50, 8),
          targetAnchor: Alignment.bottomRight,
          child: TapRegion(
            onTapOutside: (_) {
              _removeOverlay();
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    color: BooklogColors.deepGray.withOpacity(0.2),
                  )
                ],
                color: BooklogColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: _removeOverlay,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Center(
                          child: Text(
                            '내 블로그',
                            style: Typo.c12r,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _removeOverlay,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Center(
                          child: Text(
                            '글쓰기',
                            style: Typo.c12r,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _removeOverlay,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Center(
                          child: Text(
                            '로그아웃',
                            style: Typo.c12r,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (_overlayEntry == null) {
      _overlayEntry = overlayEntry;
      overlay.insert(overlayEntry);
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
