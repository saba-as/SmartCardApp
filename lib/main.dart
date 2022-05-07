import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcardapp/app.dart';
import 'package:smartcardapp/providers/student_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentProvider()),
      ],
      child: const App(),
    ),
  );
}
