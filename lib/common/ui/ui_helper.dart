import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

export 'package:flutter/material.dart';

export './widgets/k_app_bar.dart';
export './widgets/k_container.dart';

// class UiHelper {
// --- vertical spacing ---
const eesHeightSpan = SizedBox(height: 2);
const esHeightSpan = SizedBox(height: 4);
const sHeightSpan = SizedBox(height: 8);
const mHeightSpan = SizedBox(height: 16);
const lHeightSpan = SizedBox(height: 24);
const elHeightSpan = SizedBox(height: 48);

// --- horizontal spacing ---
const eesWidthSpan = SizedBox(width: 2);
const esWidthSpan = SizedBox(width: 4);
const sWidthSpan = SizedBox(width: 8);
const mWidthSpan = SizedBox(width: 16);
const lWidthSpan = SizedBox(width: 24);
const elWidthSpan = SizedBox(width: 48);

// --- page paddings ----
const lTopPagePadding = EdgeInsets.only(
  top: 128,
);
const lPagePadding = EdgeInsets.symmetric(horizontal: 64);
const mPagePadding = EdgeInsets.symmetric(horizontal: 24, vertical: 24);
const mXPagePadding = EdgeInsets.symmetric(horizontal: 32);
const mYPagePadding = EdgeInsets.symmetric(vertical: 32);
const sXPagePadding = EdgeInsets.symmetric(horizontal: 16);
const sYPagePadding = EdgeInsets.symmetric(vertical: 16);
const sPagePadding = EdgeInsets.all(16);

// container padding
const sPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 8);
const sXPadding = EdgeInsets.symmetric(horizontal: 8);
const esYPadding = EdgeInsets.symmetric(vertical: 4);
const esXPadding = EdgeInsets.symmetric(horizontal: 4);
const sYPadding = EdgeInsets.symmetric(vertical: 8);
const mPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 16);
const mXPadding = EdgeInsets.symmetric(horizontal: 12);
const mYPadding = EdgeInsets.symmetric(vertical: 12);
const lPadding = EdgeInsets.symmetric(horizontal: 18, vertical: 18);
const lXPadding = EdgeInsets.symmetric(horizontal: 18);
const lYPadding = EdgeInsets.symmetric(vertical: 18);

const elPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 24);
const elXPadding = EdgeInsets.symmetric(horizontal: 24);
const elYPadding = EdgeInsets.symmetric(vertical: 24);

const divider = Divider(color: Colors.black12, thickness: 1);

final esRadius = BorderRadius.circular(4);
final sRadius = BorderRadius.circular(8);
final mRadius = BorderRadius.circular(16);
final lRadius = BorderRadius.circular(24);
final elRadius = BorderRadius.circular(32);

//margin

const sMargin = EdgeInsets.symmetric(horizontal: 24);
