import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  const TicketClipper({
    this.borderRadius = 0,
    this.xClipperStart,
    this.yClipperStart,
    this.xClipRadius = 10,
    this.yClipRadius = 10,
    this.xClipVerticalDashSpace = 15,
    this.yClipHorizontalDashSpace = 15,
    this.horizontalDashWidth = 0,
    this.horizontalDashHeight = 0,
    this.horizontalDashSpace = 0,
    this.verticalDashWidth = 0,
    this.verticalDashHeight = 0,
    this.verticalDashSpace = 0,
  });

  /// x axis clippers are 2 clippers placed on the top and bottom of render box
  /// y axis clippers are 2 clippers placed on the left and right of render box
  /// vertical dashes are dashes start from top to bottom of render box
  /// --> vertical dashes will use center point of x axis clippers
  /// horizontal dashes are dashes start from left to right of render box
  /// --> horizontal dashes will use center point of y axis clippers

  final double borderRadius;
  final double? xClipperStart;
  final double? yClipperStart;
  final double xClipRadius;
  final double yClipRadius;
  final double xClipVerticalDashSpace, yClipHorizontalDashSpace;
  final double horizontalDashWidth, horizontalDashHeight, horizontalDashSpace;
  final double verticalDashWidth, verticalDashHeight, verticalDashSpace;

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

    /// draw y axis clipper and horizontal dashes
    // ? if [yClipperStart] is null, then draw nothing
    if (yClipperStart != null) {
      final yCenter = yClipperStart != null
          ? (yClipperStart! + yClipRadius).toDouble()
          : 0.0;
      // circle on the left
      clipPath.addOval(Rect.fromCircle(
        center: Offset(0, yCenter),
        radius: yClipRadius,
      ));

      // circle on the right
      clipPath.addOval(Rect.fromCircle(
        center: Offset(size.width, yCenter),
        radius: yClipRadius,
      ));

      // draw horizontal axis dash line
      // ? if [horizontalDashWidth] or [horizontalDashHeight] is 0, then draw nothing
      if (horizontalDashWidth > 0 && horizontalDashHeight > 0) {
        // * calculate the space to render dashes, the number of dashes, the first dash left position
        // * and the top position of dashes
        final horizontalDashRenderSpace =
            size.width - yClipHorizontalDashSpace * 2 - yClipRadius * 2;
        final horizontalDashCount =
            (horizontalDashRenderSpace + horizontalDashSpace) ~/
                (horizontalDashWidth + horizontalDashSpace);
        final horizontalDashRenderLeft = yClipHorizontalDashSpace + yClipRadius;
        final horizontalDashTop = yCenter - horizontalDashHeight / 2;

        // * draw dashes
        for (var i = 0; i < horizontalDashCount; i++) {
          clipPath.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(
              i * (horizontalDashWidth + horizontalDashSpace).toDouble() +
                  horizontalDashRenderLeft,
              horizontalDashTop,
              horizontalDashWidth,
              horizontalDashHeight,
            ),
            Radius.circular(horizontalDashWidth > horizontalDashHeight
                ? horizontalDashWidth
                : horizontalDashHeight),
          ));
        }
      }
    }

    /// draw c axis clipper and vertical dashes
    // ? if [xClipperStart] is null, then draw nothing
    if (xClipperStart != null) {
      final xCenter = xClipperStart != null
          ? (xClipperStart! + xClipRadius).toDouble()
          : 0.0;

      // circle on the top
      clipPath.addOval(Rect.fromCircle(
        center: Offset(xCenter, 0),
        radius: xClipRadius,
      ));

      // circle on the bottom
      clipPath.addOval(Rect.fromCircle(
        center: Offset(xCenter, size.height),
        radius: xClipRadius,
      ));

      // draw vertical axis dash line
      // ? if [verticalDashWidth] or [verticalDashHeight] is 0, then draw nothing
      if (verticalDashWidth > 0 && verticalDashHeight > 0) {
        // * calculate the space to render dashes, the number of dashes, the first dash left position
        // * and the top position of dashes
        final verticalDashRenderSpace =
            size.height - (xClipVerticalDashSpace * 2) - (xClipRadius * 2);
        final verticalDashCount =
            (verticalDashRenderSpace + verticalDashSpace) ~/
                (verticalDashHeight + verticalDashSpace);
        final verticalDashRenderTop = xClipVerticalDashSpace + xClipRadius;
        final verticalDashLeft = xCenter - verticalDashWidth / 2;

        // * draw dashes
        for (var i = 0; i < verticalDashCount; i++) {
          clipPath.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(
              verticalDashLeft,
              i * (verticalDashHeight + verticalDashSpace).toDouble() +
                  verticalDashRenderTop,
              verticalDashWidth,
              verticalDashHeight,
            ),
            Radius.circular(verticalDashWidth > verticalDashHeight
                ? verticalDashWidth
                : verticalDashHeight),
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
