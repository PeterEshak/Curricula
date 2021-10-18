import 'package:curricula_apple/models/providers/language_provider.dart';
import 'package:curricula_apple/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PagePDF extends StatefulWidget {
  final String pdfAssets;
  const PagePDF({required this.pdfAssets, Key? key}) : super(key: key);

  @override
  _PagePDF createState() => _PagePDF();
}

class _PagePDF extends State<PagePDF> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  PdfViewerController _pdfViewerController = PdfViewerController();
  // OverlayEntry? _overlayEntry;
  // void showContextMenu(
  //     BuildContext context, PdfTextSelectionChangedDetails details) {
  //   final OverlayState _overlayState = Overlay.of(context)!;
  //   _overlayEntry = OverlayEntry(
  //     builder: (context) => Positioned(
  //       top: details.globalSelectedRegion!.center.dy - 55,
  //       left: details.globalSelectedRegion!.bottomLeft.dx,
  //       child: MaterialButton(
  //         onPressed: () {
  //           Clipboard.setData(ClipboardData(text: details.selectedText));
  //           _pdfViewerController.clearSelection();
  //         },
  //         color: Colors.white,
  //         elevation: 10,
  //         child: const Text('Copy', style: TextStyle(fontSize: 17)),
  //       ),
  //     ),
  //   );
  //   _overlayState.insert(_overlayEntry!);
  // }

  double zoom = 1;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider lan = Provider.of<LanguageProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(lan.getTexts('pdf_viewer').toString()),
        centerTitle: true,
        // actions: [
        //   SingleChildScrollView(
        //     // physics: const NeverScrollableScrollPhysics(),
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       children: [
        //         IconButton(
        //           icon: const Icon(
        //             Icons.bookmark,
        //             color: Colors.white,
        //           ),
        //           onPressed: () =>
        //               _pdfViewerKey.currentState?.openBookmarkView(),
        //         ),
        //         IconButton(
        //           icon: const Icon(
        //             Icons.zoom_in,
        //             color: Colors.white,
        //           ),
        //           onPressed: () => setState(() {
        //             if (zoom >= 1) {
        //               if (zoom < 5) {
        //                 zoom += .5;
        //                 _pdfViewerController.zoomLevel = zoom;
        //               } else
        //                 showToast(
        //                     text: 'that is most zoom in',
        //                     state: ToastStates.wARNING);
        //             }
        //           }),
        //         ),
        //         IconButton(
        //           icon: const Icon(
        //             Icons.zoom_out,
        //             color: Colors.white,
        //           ),
        //           onPressed: () => setState(() {
        //             if (zoom >= .5) {
        //               zoom -= .5;
        //               _pdfViewerController.zoomLevel = zoom;
        //             } else
        //               showToast(
        //                   text: 'that is most zoom out',
        //                   state: ToastStates.wARNING);
        //           }),
        //         ),
        //         Row(
        //           children: [
        //             IconButton(
        //               icon: const Icon(
        //                 Icons.arrow_circle_up,
        //                 color: Colors.white,
        //               ),
        //               onPressed: () => _pdfViewerController.firstPage(),
        //             ),
        //             IconButton(
        //               icon: const Icon(
        //                 Icons.arrow_circle_down,
        //                 color: Colors.white,
        //               ),
        //               onPressed: () => _pdfViewerController.lastPage(),
        //             ),
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             IconButton(
        //               icon: const Icon(
        //                 Icons.arrow_circle_up,
        //                 color: Colors.white,
        //               ),
        //               onPressed: () => _pdfViewerController.nextPage(),
        //             ),
        //             IconButton(
        //               icon: const Icon(
        //                 Icons.arrow_circle_down,
        //                 color: Colors.white,
        //               ),
        //               onPressed: () => _pdfViewerController.previousPage(),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  onPressed: () =>
                      _pdfViewerKey.currentState?.openBookmarkView(),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.zoom_in,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(() {
                    if (zoom >= 1) {
                      if (zoom < 5) {
                        zoom += .5;
                        _pdfViewerController.zoomLevel = zoom;
                      } else
                        showToast(
                            text: 'that is most zoom in',
                            state: ToastStates.wARNING);
                    }
                  }),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.zoom_out,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(() {
                    if (zoom >= .5) {
                      zoom -= .5;
                      _pdfViewerController.zoomLevel = zoom;
                    } else
                      showToast(
                          text: 'that is most zoom out',
                          state: ToastStates.wARNING);
                  }),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_circle_up,
                        color: Colors.white,
                      ),
                      onPressed: () => _pdfViewerController.firstPage(),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                      ),
                      onPressed: () => _pdfViewerController.lastPage(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_circle_up,
                        color: Colors.white,
                      ),
                      onPressed: () => _pdfViewerController.nextPage(),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                      ),
                      onPressed: () => _pdfViewerController.previousPage(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SfPdfViewer.network(
            widget.pdfAssets,
            key: _pdfViewerKey,
            controller: _pdfViewerController,
            // onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
            //   if (details.selectedText == null && _overlayEntry != null) {
            //     _overlayEntry!.remove();
            //     _overlayEntry = null;
            //   } else if (details.selectedText != null && _overlayEntry == null)
            //     _showContextMenu(context, details);
            // },
            // onDocumentLoaded: (PdfDocumentLoadedDetails pdfDocumentLoadedDetails) {
            //   showToast(
            //     text:
            //         'onDocumentLoaded ||\n document: ${pdfDocumentLoadedDetails.document}',
            //     state: ToastStates.eRROR,
            //   );
            //   print('onDocumentLoaded || ${pdfDocumentLoadedDetails.document}');
            // },
            // onDocumentLoadFailed:
            //     (PdfDocumentLoadFailedDetails pdfDocumentLoadFailedDetails) {
            //   showToast(
            //     text:
            //         'onDocumentLoadFailed ||\n Error: ${pdfDocumentLoadFailedDetails.error} ||\n Description: ${pdfDocumentLoadFailedDetails.description}',
            //     state: ToastStates.eRROR,
            //   );
            // },
          ),
        ],
      ),
    );
  }
}
