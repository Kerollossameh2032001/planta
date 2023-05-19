//Doc Item UI
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:planta/authentication/presentation/widgets/register_as_eng_component/read_doc_screen.dart';

import '../../../../core/global/components/navigate_to.dart';

class DocumentItem extends StatelessWidget {
  final PlatformFile? details;
  final File? document;

  DocumentItem({Key? key, required this.details, this.document})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          details!.name,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        subtitle: Text(
          '${(details!.size / 1024).round()} KB',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.grey),
        ),
        onTap: () {
          navigateTo(
              context: context,
              destination:
              ReadDocumentScreen(document: document, details: details));
        },
        leading: const Icon(
          Icons.picture_as_pdf_outlined,
          color: Colors.red,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //side: BorderSide()
        ),
        enabled: true,
      ),
    );
  }
}