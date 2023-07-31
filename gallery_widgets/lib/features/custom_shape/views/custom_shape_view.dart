import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/custom_shape/widgets/discount_describe.dart';
import 'package:gallery_widgets/features/custom_shape/widgets/discount_value.dart';
import 'package:gallery_widgets/widgets/ticket_clip_path.dart';

class CustomShapeView extends StatelessWidget {
  const CustomShapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Shape'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Center(
          child: Container(
            height: 107.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipPath(
              clipper: const TicketClipper(
                borderRadius: 10,
                xClipperStart: 80,
                xClipRadius: 8,
                xClipVerticalDashSpace: 5.0,
                verticalDashHeight: 4.0,
                verticalDashSpace: 3.0,
                verticalDashWidth: 1.0,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                color: Colors.white,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DiscountValue(),
                    SizedBox(width: 30),
                    Expanded(child: DiscountDescribe()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
