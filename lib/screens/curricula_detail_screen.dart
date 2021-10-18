import 'package:curricula_apple/models/providers/curricula_provider.dart';
import 'package:curricula_apple/models/providers/language_provider.dart';
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
        child: Text(
          text,
          style: Theme.of(ctx).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      );

  Widget buildContainer(Widget child) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: isLandscape ? dh * .5 : dh * .25,
      width: isLandscape ? (dw * 0.5 - 2 * 0) : dw,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    final curriculaId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedCurricula =
        dummyCurricula.firstWhere((curricula) => curricula.id == curriculaId);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title:
                  Text(lan.getTexts('cur-${selectedCurricula.id}').toString()),
              background: Hero(
                tag: curriculaId,
                child: InteractiveViewer(
                  child: FadeInImage(
                    image: NetworkImage(selectedCurricula.image),
                    placeholder: const AssetImage('assets/images/books.jfif'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    //urlLunch(context),
                    if (selectedCurricula.links.isEmpty)
                      Text(
                        '${lan.getTexts('link_empty').toString()} ${lan.getTexts('cur-${selectedCurricula.id}')}',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline6!.color),
                      ),
                    if (selectedCurricula.links.isNotEmpty)
                      buildSectionTitle(
                        context,
                        '${lan.getTexts('link_not_empty').toString()} ${lan.getTexts('cur-${selectedCurricula.id}')}',
                      ),
                    buildContainer(
                      ListView.builder(
                        itemBuilder: (ctx, index) => Card(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: selectedCurricula.links[index].isNotEmpty
                                ? ElevatedButton(
                                    // child: Text(
                                    //   lan.getTexts('links-id') as List<String>,
                                    //   style: Theme.of(ctx).textTheme.headline6,
                                    // ),
                                    child: Text(
                                      selectedCurricula.links[index],
                                      style: Theme.of(ctx).textTheme.headline6,
                                    ),
                                    onPressed: () => launched =
                                        _launchInBrowser(
                                            selectedCurricula.links[index]),
                                  )
                                : Text(
                                    '${lan.getTexts('link_empty').toString()} ${lan.getTexts('cur-${selectedCurricula.id}')}',
                                    style: Theme.of(ctx).textTheme.headline6,
                                  ),
                          ),
                        ),
                        itemCount: selectedCurricula.links.length,
                      ),
                    ),
                    if (selectedCurricula.links.isNotEmpty)

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
                        child: Text(lan.getTexts('pdf_viewer').toString()),
                        onPressed: () =>
                            launched = _launchInBrowser(selectedCurricula.pdf),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
