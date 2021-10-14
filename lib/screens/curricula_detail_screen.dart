import 'package:curricula_apple/models/providers/curricula_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../dummy_data.dart';
// import 'pdf_screen.dart';

class CurriculaDetailScreen extends StatefulWidget {
  static const routeName = '/curricula_detail';

  const CurriculaDetailScreen({Key? key}) : super(key: key);

  @override
  _CurriculaDetailScreenState createState() => _CurriculaDetailScreenState();
}

class _CurriculaDetailScreenState extends State<CurriculaDetailScreen> {
  String urlText = 'افتح الشرح';
  Future<void>? launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        //headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildSectionTitle(BuildContext ctx, String text) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style: Theme.of(ctx).textTheme.headline6),
      );

  Widget buildContainer(Widget child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final curriculaId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedCurricula =
        dummyCurricula.firstWhere((curricula) => curricula.id == curriculaId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCurricula.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedCurricula.image,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  dynamic myAnalytics;
                  myAnalytics.recordError(
                    'An error occurred loading "${selectedCurricula.image}"',
                    exception,
                    stackTrace,
                  );
                  return const Text('😢');
                },
              ),
            ),
            //urlLunch(context),
            if (selectedCurricula.ingredients.isEmpty)
              Text(
                'لا يوجد فديوهات شرح لماده ${selectedCurricula.title}',
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline6!.color),
              ),
            if (selectedCurricula.ingredients.isNotEmpty)
              buildSectionTitle(
                  context, 'فديوهات شرح لماده ${selectedCurricula.title}'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: selectedCurricula.ingredients[index].isNotEmpty
                        ? ElevatedButton(
                            child: Text(
                              selectedCurricula.ingredients[index],
                              style: Theme.of(ctx).textTheme.headline6,
                            ),
                            onPressed: () => launched = _launchInBrowser(
                                selectedCurricula.ingredients[index]),
                          )
                        : Text(
                            'لا يوجد فديوهات لماده ${selectedCurricula.title} حتي الان',style: Theme.of(ctx).textTheme.headline6,),
                  ),
                ),
                itemCount: selectedCurricula.ingredients.length,
              ),
            ),
            if (selectedCurricula.ingredients.isNotEmpty)

              // GestureDetector(
              //   onTap: () {
              //     _launchUrl("https://www.google.com/");
              //     // _launchUrl("${selectedCurricula.ingredients.toString()}");
              //   },
              //   child: Container(
              //     height: 40,
              //     width: 100,
              //     color: Colors.green,
              //     child: Center(child: Text("Launch Url")),
              //   ),
              // ),
              ElevatedButton(
                child: const Text('Open PDF'),
                onPressed: () =>
                    launched = _launchInBrowser(selectedCurricula.pdf),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<CurriculaProvider>(context, listen: false)
            .toggleFavorite(curriculaId),
        child: Icon(Provider.of<CurriculaProvider>(context, listen: true)
                .isFavorite(curriculaId)
            ? Icons.star
            : Icons.star_border),
      ),
    );
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      print('Can\'t Launch $url');
    }
  }
}
