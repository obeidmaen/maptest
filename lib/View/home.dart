import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PolylinePage extends StatefulWidget {
  static const String route = 'polyline';

  const PolylinePage({Key key}) : super(key: key);

  @override
  State<PolylinePage> createState() => _PolylinePageState();
}

class _PolylinePageState extends State<PolylinePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pointsGradient = <LatLng>[
      LatLng(25.005972656239187, 5.2734375),
      LatLng(21.289374355860424, 46.58203125),
    ];

    final filledPoints = <LatLng>[
      LatLng(27.839076094777816, 68.90625),
      LatLng(27.68352808378776, 46.58203125),
      LatLng(36.4566360115962, 52.20703125),
    ];

    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: LatLng(30.600093873550072, 36.5625),
        builder: (ctx) => Icon(
          Icons.place,
          size: 40,
          color: Colors.pink,
        ),
      ),
    ];

    return Scaffold(
        appBar: AppBar(title: const Text('Polylines')),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text('Polylines'),
              ),
              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(24.046463999666567, 36.826171875),
                    zoom: 4,
                    maxZoom: 18,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: pointsGradient,
                          strokeWidth: 4,
                          gradientColors: [
                            const Color(0xffE40203),
                            const Color(0xffFEED00),
                            const Color(0xff007E2D),
                          ],
                        ),
                      ],
                    ),
                    PolygonLayer(
                      polygons: [
                        Polygon(
                          points: filledPoints,
                          isFilled: true,
                          color: Colors.purple.withOpacity(0.3),
                          borderColor: Colors.purple,
                          borderStrokeWidth: 4,
                        ),
                      ],
                    ),
                    MarkerLayer(markers: markers),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
