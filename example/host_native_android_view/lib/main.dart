import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/compass_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CompassBloc(),
    child: const MaterialApp(home: CompassPage()),
  ));
}

class CompassPage extends StatelessWidget {
  const CompassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CompassBloc compassBloc = context.watch<CompassBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Native compass')),
      body: const CompassView(),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'fps: ${compassBloc.state.fps}',
                  floatingLabelBehavior: FloatingLabelBehavior.always),
              onSubmitted: (value) =>
                  compassBloc.add(CompassEvent.setFps(value)),
            ),
          ),
          TextButton(
              onPressed: () =>
                  compassBloc.add(const CompassEvent.toggleShowMarker()),
              child: Text(compassBloc.state.showMarker
                  ? 'Hide marker'
                  : 'Show marker')),
        ],
      ),
    );
  }
}

class CompassView extends StatelessWidget {
  const CompassView({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewType = 'native-compass';
    return PlatformViewLink(
      viewType: viewType,
      surfaceFactory: (context, controller) => AndroidViewSurface(
        controller: controller as AndroidViewController,
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
      ),
      onCreatePlatformView: (params) =>
          PlatformViewsService.initSurfaceAndroidView(
        id: params.id,
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParamsCodec: const StandardMessageCodec(),
        onFocus: () {
          params.onFocusChanged(true);
        },
      )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create(),
    );
  }
}
