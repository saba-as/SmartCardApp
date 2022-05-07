import 'package:flutter/cupertino.dart';
import 'package:smartcardapp/data/api/get_student.dart';
import 'package:smartcardapp/data/models/student_model.dart';

class StudentProvider extends ChangeNotifier {
  bool _isloading = false;
  StudentModel? _student;
  String _errorMessage = "";

  StudentModel? get student => _student;
  bool get isloading => _isloading;
  String get errorMessage => _errorMessage;

  void setStudent(String id) async {
    _isloading = true;
    StudentServices _studentServices = StudentServices();

    await _studentServices.fetchData(id).then((res) {
      if (res!.isSuccessful!) {
        _isloading = false;
        _student = res.data;
        notifyListeners();
      } else {
        _isloading = false;
        _errorMessage = res.message ?? "";
        notifyListeners();
      }
    });
    _student = student;
    notifyListeners();
  }

  void deleteStudent() {
    _student = null;
    notifyListeners();
  }

  void setIsLoading(bool isLoading) {
    _isloading = isLoading;
    notifyListeners();
  }

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }
}
