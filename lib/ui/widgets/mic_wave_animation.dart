// lib/ui/widgets/mic_wave_animation.dart

import 'package:flutter/material.dart';

/// 음성 인식 중임을 나타내는 파동 애니메이션 위젯
class MicWaveAnimation extends StatefulWidget {
  final bool isListening;

  const MicWaveAnimation({super.key, required this.isListening});

  @override
  State<MicWaveAnimation> createState() => _MicWaveAnimationState();
}

class _MicWaveAnimationState extends State<MicWaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    if (widget.isListening) _controller.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(MicWaveAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isListening) {
      _controller.repeat(reverse: true);
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isListening
                ? const Color(0xFF673AB7).withOpacity(0.2 + (_controller.value * 0.3))
                : Colors.grey.withOpacity(0.1),
          ),
          child: Icon(
            widget.isListening ? Icons.mic : Icons.mic_none,
            size: 80,
            color: widget.isListening ? const Color(0xFF673AB7) : Colors.grey,
          ),
        );
      },
    );
  }
}
