import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcardapp/config/app_settings.dart';
import 'package:smartcardapp/providers/student_provider.dart';
import 'package:smartcardapp/views/home.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: studentProvider.isloading
              ? const Center(
                  child: Text("جاري التحميل"),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: Image.network(
                          AppSettings.baseUrl +
                              "/" +
                              studentProvider.student!.image!,
                          fit: BoxFit.cover),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              studentProvider.student?.name ?? "",
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              studentProvider.student?.department ?? "",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              studentProvider.student?.study ?? "",
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${studentProvider.student?.idNumber ?? ""} :رقم الهوية",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "${studentProvider.student?.expireAt ?? ""} :تاريخ النفاذ",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ))
                  ],
                ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "عودة للبحث",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
