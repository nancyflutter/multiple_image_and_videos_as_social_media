import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../core/core.dart';

class PDFViewerPage extends StatelessWidget {
  final String pdfUrl;
  final String name;

  const PDFViewerPage({super.key, required this.pdfUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(name, style: Theme.of(context).grayCliff600.copyWith(fontSize: 16.sp)),
        leading: Icon(Icons.arrow_back_ios_new_outlined, color: MyColors.black, size: 20.sp).addGesture(() => Get.back(canPop: true, closeOverlays: true)),
      ),
      body: SfPdfViewer.network(pdfUrl),
    );
  }
}
