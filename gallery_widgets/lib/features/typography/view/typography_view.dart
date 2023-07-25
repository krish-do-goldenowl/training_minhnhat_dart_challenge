import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/typography/widgets/basic_rich_text.dart';
import 'package:gallery_widgets/features/typography/widgets/basic_text_widget.dart';
import 'package:gallery_widgets/features/typography/widgets/colorful_google_text.dart';
import 'package:gallery_widgets/features/typography/widgets/rich_text_with_widget_span.dart';

class TypographyView extends StatelessWidget {
  const TypographyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text View'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - 56,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicTextWidget(),
              RichTextWithWidgetSpan(),
              BasicRichText(),
              ColorfulGoogleText(),
            ],
          ),
        ),
      ),
    );
  }
}
