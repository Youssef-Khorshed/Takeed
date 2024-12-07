import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pdf/widgets.dart' as pw;

class Boardingfooter extends StatefulWidget {
  ScreenshotController screenshotController;
  Boardingfooter({super.key, required this.screenshotController});

  @override
  State<Boardingfooter> createState() => _BoardingfooterState();
}

class _BoardingfooterState extends State<Boardingfooter> {
  final ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // // Barcode
        Center(
          child: Column(
            children: [
              Qr(data: 'IND222B589659', size: 150),
              const SizedBox(height: 8),
              const Text("IND222B589659"),
            ],
          ),
        ),
        // Spacer(),

        // Download Button
        SizedBox(height: 14.h),

        AppTextButton(
            buttonText: 'Download',
            textStyle: TextStyles.font18WhiteRegular,
            onPressed: () async {
              await _captureAndSaveAsPDF();
              // SharedPrefHelper.setData( "barcode", value)
            }),
        SizedBox(height: 14.h),

        TextButton(
          onPressed: () {
            context.pushNamed(Routes.search);
          },
          child: Text(
            "Book another flight",
            style: TextStyles.font18orangeRegular,
          ),
        ),
      ],
    );
  }

  Future<void> _captureAndSaveAsPDF() async {
    try {
      // Capture the widget as image bytes
      final Uint8List? screenshot = await widget.screenshotController.capture();
      debugPrint('screenshot $screenshot');
      if (screenshot == null) return;

      // Create a PDF document and add the screenshot as an image
      final pdf = pw.Document();
      final image = pw.MemoryImage(screenshot);
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Center(child: pw.Image(image)),
        ),
      );

      // Get the path to save the file
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/screenshot.pdf');

      // Save the PDF document to a file
      await file.writeAsBytes(await pdf.save());
      print(file.path);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved to ${file.path}')),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

class Qr extends StatelessWidget {
  String data;
  double size;
  Qr({super.key, required this.data, required this.size});

  @override
  Widget build(BuildContext context) {
    return QrImageView(data: data, version: QrVersions.auto, size: size);
  }
}
