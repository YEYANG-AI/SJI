import 'package:flutter/material.dart';

class OptionSelectorOverlay extends StatefulWidget {
  final Map<String, Widget> options;
  final String initialOption;
  final ValueChanged<String>? onSelected;

  const OptionSelectorOverlay({
    super.key,
    required this.options,
    this.initialOption = "All",
    this.onSelected,
  });

  @override
  State<OptionSelectorOverlay> createState() => _OptionSelectorOverlayState();
}

class _OptionSelectorOverlayState extends State<OptionSelectorOverlay> {
  late String selectedOption;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialOption;
  }

  void _toggleOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlay();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  double _getMaxWidth(BuildContext context) {
    final textStyles = DefaultTextStyle.of(context).style;
    double maxWidth = 0;
    for (var option in widget.options.keys) {
      final textPainter = TextPainter(
        text: TextSpan(text: option, style: textStyles),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();
      if (textPainter.width > maxWidth) maxWidth = textPainter.width;
    }
    // add padding + icon width
    return maxWidth + 20 + 24; // horizontal padding + icon
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    double overlayWidth = _getMaxWidth(context);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + renderBox.size.height,
        width: overlayWidth,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange.shade800,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.options.keys
                  .where((o) => o != selectedOption)
                  .map(
                    (option) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                        widget.onSelected?.call(option);
                        _overlayEntry?.remove();
                        _overlayEntry = null;

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => widget.options.values.first,
                        //   ),
                        // );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: _toggleOverlay,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange.shade800,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedOption,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
