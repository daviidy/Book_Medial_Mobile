import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'light_color.dart';

final spinkit1 = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? LightColor.primary : LightColor.primary,
      ),
    );
  },
);

final spinkit2 = SpinKitRotatingCircle(
  color: LightColor.primary,
  size: 50.0,
);

final spinkit3 = SpinKitFadingGrid(
  color: LightColor.primary,
  size: 50.0,
);

final spinkit4 = SpinKitWave(
  color: LightColor.primary,
  size: 50.0,
);

final spinkit5 = SpinKitWanderingCubes(
  color: LightColor.primary,
  size: 50.0,
);

final spinkit6 = SpinKitThreeBounce(
  color: LightColor.primary,
  size: 50.0,
);

final spinkit7 = SpinKitDoubleBounce(
  color: LightColor.primary,
  size: 50.0,
);

final spinkit8 = SpinKitChasingDots(
  color: LightColor.primary,
  size: 50.0,
);

final spinkit9 = SpinKitPulse(
  color: LightColor.primary,
  size: 50.0,
);

final spinkit10 = SpinKitSquareCircle(
  color: Colors.white,
  size: 50.0,
);

final spinkit11 = SpinKitRipple(
  color: LightColor.primary,
  size: 50.0,
);


