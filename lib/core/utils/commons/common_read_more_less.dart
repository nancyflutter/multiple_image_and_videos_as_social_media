import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// FOR READ MORE TEXT
class ReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int maxLines;

  const ReadMoreText({
    super.key,
    required this.text,
    required this.style,
    this.maxLines = 3,
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  // RxBool isExpanded = RxBool(false);
  late String firstPart;
  late String secondPart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _splitText();
  }

  void _splitText() {
    const padding = 16.0; // Example padding or margin
    final double availableWidth =
        MediaQuery.of(context).size.width - (padding * 2);

    final textSpan = TextSpan(text: widget.text, style: widget.style);
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: availableWidth);

    if (textPainter.didExceedMaxLines) {
      int endIndex = textPainter
          .getPositionForOffset(
        Offset(textPainter.size.width, textPainter.size.height),
      )
          .offset;

      firstPart = widget.text.substring(0, endIndex);
      secondPart = widget.text.substring(endIndex);
      setState(() {});
    } else {
      firstPart = widget.text;
      secondPart = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: widget.style,
        children: [
          TextSpan(
            text: isExpanded ? (firstPart + secondPart) : firstPart,
          ),
          if (secondPart.isNotEmpty)
            TextSpan(
              text: isExpanded ? ' Read less' : '... Read more',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
            ),
        ],
      ),
    );
  }
}