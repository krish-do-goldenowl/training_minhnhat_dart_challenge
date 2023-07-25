import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/widgets/ticket_clip_path.dart';

class MaterialRawMaterialButton extends StatelessWidget {
  const MaterialRawMaterialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: TicketClipper(
            borderRadius: 10,
            yClipperStart: MediaQuery.sizeOf(context).width * 0.23,
            yClipRadius: 8,
          ),
          child: MaterialButton(
            onPressed: () {},
            minWidth: MediaQuery.sizeOf(context).width,
            color: Colors.grey,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 7,
              ),
              child: Text('Material Button'),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // second
        RawMaterialButton(
          onPressed: () {},
          constraints: BoxConstraints(
            minWidth: MediaQuery.sizeOf(context).width,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.transparent,
          elevation: 0,
          focusElevation: 1.5,
          textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
          child: ClipPath(
            clipper: TicketClipper(
              borderRadius: 10,
              yClipperStart: MediaQuery.sizeOf(context).width * 0.23,
              yClipRadius: 8,
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 7,
              ),
              color: Colors.grey,
              child: const Text('Raw Material Button'),
            ),
          ),
        ),
      ],
    );
  }
}
