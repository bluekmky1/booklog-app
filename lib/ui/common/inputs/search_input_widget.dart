import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/booklog_colors.dart';
import '../../../theme/typographies.dart';
import '../consts/assets.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({
    required this.textEditingController,
    required this.onClear,
    required this.onSearch,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  final ValueChanged<String>? onChanged;
  final TextEditingController textEditingController;
  final VoidCallback? onEditingComplete;
  final VoidCallback onClear;
  final VoidCallback onSearch;

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onEditingComplete: widget.onEditingComplete,
                onChanged: widget.onChanged,
                controller: widget.textEditingController,
                cursorColor: BooklogColors.point,
                cursorWidth: 1,
                style: Typo.b16r,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8),
                  hintText: '궁금한 책 제목이나 저자를 검색해보세요!',
                  hintStyle: Typo.c12r,
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 28,
                    maxWidth: 76,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: widget.textEditingController.text.isNotEmpty
                        ? Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  widget.onClear();
                                  setState(() {
                                    widget.textEditingController.clear();
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                                child: SvgPicture.asset(
                                  width: 16,
                                  height: 16,
                                  Assets.clear,
                                  colorFilter: const ColorFilter.mode(
                                    BooklogColors.main,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  widget.onSearch();
                                },
                                child: SvgPicture.asset(
                                  width: 16,
                                  height: 16,
                                  Assets.search,
                                  colorFilter: const ColorFilter.mode(
                                    BooklogColors.main,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SvgPicture.asset(
                            width: 16,
                            height: 16,
                            Assets.search,
                            colorFilter: const ColorFilter.mode(
                              BooklogColors.main,
                              BlendMode.srcIn,
                            ),
                          ),
                  ),
                ),
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ),
        ],
      );
}
