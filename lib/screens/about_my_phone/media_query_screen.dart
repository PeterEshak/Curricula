import 'package:flutter/material.dart';

class MediaQueryWidget extends StatefulWidget {

  const MediaQueryWidget({Key? key}) : super(key: key);

  @override
  State<MediaQueryWidget> createState() => _MediaQueryWidgetState();
}

class _MediaQueryWidgetState extends State<MediaQueryWidget> {
  late MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Media Query')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tile(title: 'Screen height', size: mediaQuery.size.height),
              tile(title: 'Screen Width', size: mediaQuery.size.width),
              tile(title: 'Notch Size', size: mediaQuery.padding.bottom),
              tile(title: 'Screen height', size: mediaQuery.size.height),
              tile(directText:
                  'Scale factor height ${mediaQuery.textScaleFactor}'),
              tile(directText: 'Color inverted : ${mediaQuery.invertColors}'),
              tile(directText:
                  'Os theme(light/dark) : ${mediaQuery.platformBrightness}'),
              tile(directText:
                  'High Contrast Screen : ${mediaQuery.highContrast}'),
              tile(directText:
                  'Animation enabled : ${!mediaQuery.disableAnimations}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget tile({String? title, double? size, String? directText}) => SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              directText!,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );

  String info(String title, double size) => '$title $size && in pixel : ${size * mediaQuery.devicePixelRatio}';
}