import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  const TicketClipper({
    this.borderRadius = 0,
    this.xClipperStart,
    this.yClipperStart,
    this.xClipRadius = 10,
    this.yClipRadius = 10,
    this.xClipDashSpace = 15,
    this.yClipDashSpace = 15,
    this.xDashWidth = 0,
    this.xDashHeight = 0,
    this.xDashSpace = 0,
    this.yDashWidth = 0,
    this.yDashHeight = 0,
    this.yDashSpace = 0,
  });

  final double borderRadius;
  final double? xClipperStart;
  final double? yClipperStart;
  final double xClipRadius;
  final double yClipRadius;
  final double xClipDashSpace, yClipDashSpace;
  final double xDashWidth, xDashHeight, xDashSpace;
  final double yDashWidth, yDashHeight, yDashSpace;

  @override
  Path getClip(Size size) {
    var path = Path();

    // * draw the origin shape (not clipped shape)
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    ));

    // * draw clippers and dashes (both x axis and y axis if they are not null)
    final clipPath = Path();

    /// draw x axis clipper and x dashes
    // ? if [xClipperStart] is null, then draw nothing
    if (xClipperStart != null) {
      final xCenter = xClipperStart != null
          ? (xClipperStart! + xClipRadius).toDouble()
          : 0.0;
      // circle on the left
      clipPath.addOval(Rect.fromCircle(
        center: Offset(0, xCenter),
        radius: xClipRadius,
      ));

      // circle on the right
      clipPath.addOval(Rect.fromCircle(
        center: Offset(size.width, xCenter),
        radius: xClipRadius,
      ));

      // draw x axis dash line
      // ? if [xDashWidth] or [xDashHeight] is 0, then draw nothing
      if (xDashWidth > 0 && xDashHeight > 0) {
        // * calculate the space to render dashes, the number of dashes, the first dash left position
        // * and the top position of dashes
        final xDashRenderSpace =
            size.width - xClipDashSpace * 2 - xClipRadius * 2;
        final xDashCount =
            (xDashRenderSpace / (xDashWidth + xDashSpace)).floor();
        final xDashRenderLeft = xClipDashSpace + xClipRadius;
        final xDashTop = xCenter - xDashHeight / 2;

        // * draw dashes
        for (var i = 0; i < xDashCount; i++) {
          clipPath.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(
              i * (xDashWidth + xDashSpace).toDouble() + xDashRenderLeft,
              xDashTop,
              xDashWidth,
              xDashHeight,
            ),
            Radius.circular(
                xDashWidth > xDashHeight ? xDashWidth : xDashHeight),
          ));
        }
      }
    }

    /// draw y axis clipper and y dashes
    // ? if [yClipperStart] is null, then draw nothing
    if (yClipperStart != null) {
      final yCenter = yClipperStart != null
          ? (yClipperStart! + yClipRadius).toDouble()
          : 0.0;

      // circle on the top
      clipPath.addOval(Rect.fromCircle(
        center: Offset(yCenter, 0),
        radius: yClipRadius,
      ));

      // circle on the bottom
      clipPath.addOval(Rect.fromCircle(
        center: Offset(yCenter, size.height),
        radius: yClipRadius,
      ));

      // draw y axis dash line
      // ? if [yDashWidth] or [yDashHeight] is 0, then draw nothing
      if (yDashWidth > 0 && yDashHeight > 0) {
        // * calculate the space to render dashes, the number of dashes, the first dash left position
        // * and the top position of dashes
        final yDashRenderSpace =
            size.height - yClipDashSpace * 2 - yClipRadius * 2;
        final yDashCount =
            (yDashRenderSpace / (yDashWidth + yDashSpace)).floor();
        final yDashRenderTop = yClipDashSpace + yClipRadius;
        final yDashLeft = yCenter - yDashWidth / 2;

        // * draw dashes
        for (var i = 0; i < yDashCount; i++) {
          clipPath.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(
              yDashLeft,
              i * (yDashWidth + yDashSpace).toDouble() + yDashRenderTop,
              yDashWidth,
              yDashHeight,
            ),
            Radius.circular(
                yDashWidth > yDashHeight ? yDashWidth : yDashHeight),
          ));
        }
      }
    }

    // * reverse difference the origin shape and the clipper shape
    final ticketPath = Path.combine(
      PathOperation.reverseDifference,
      clipPath,
      path,
    );

    return ticketPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
