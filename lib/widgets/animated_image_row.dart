import 'package:flutter/material.dart';
import 'package:recasttask/widgets/animated_image_card.dart';

class AnimatedImageRow extends StatefulWidget {
  final List<String> items;
  final bool isLeftToRight;
  final double height;
  final double speed;

  const AnimatedImageRow({
    super.key,
    required this.items,
    this.isLeftToRight = true,
    this.height = 120,
    this.speed = 30.0,
  });

  @override
  State<AnimatedImageRow> createState() => _AnimatedImageRowState();
}

class _AnimatedImageRowState extends State<AnimatedImageRow>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  int _activeItemIndex = 0;

  @override
  void initState() {
    super.initState();
    final initialOffset = widget.items.length * 156.0 * 10; //

    _scrollController = ScrollController(
      initialScrollOffset: widget.isLeftToRight ? 0.0 : initialOffset * 2,
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(_updateScroll);

    _scrollController.addListener(_updateActiveItem);

    _animationController.repeat();
  }

  void _updateScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;

    if (!position.hasPixels || !position.hasContentDimensions) return;

    final delta = widget.speed / 60;

    final currentOffset = position.pixels;
    final maxOffset = position.maxScrollExtent;

    double nextOffset = currentOffset + (widget.isLeftToRight ? delta : -delta);

    if (nextOffset >= maxOffset) {
      nextOffset -= widget.items.length * 156.0 * 5;
      _scrollController.jumpTo(nextOffset);
      return;
    } else if (nextOffset <= 0) {
      nextOffset += widget.items.length * 156.0 * 5;
      _scrollController.jumpTo(nextOffset);
      return;
    }

    _scrollController.jumpTo(nextOffset);
  }

  void _updateActiveItem() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final viewportWidth = _scrollController.position.viewportDimension;
    final centerOffset = offset + (viewportWidth / 2);

    final centeredItemRawIndex = (centerOffset / 156.0).floor();

    final realIndex = centeredItemRawIndex % widget.items.length;

    if (_activeItemIndex != realIndex) {
      if (mounted) {
        setState(() {
          _activeItemIndex = realIndex;
        });
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.items.length * 100,
        itemBuilder: (context, index) {
          final realIndex = index % widget.items.length;
          final item = widget.items[realIndex];

          return AnimatedImageCard(image: item);
        },
      ),
    );
  }
}
