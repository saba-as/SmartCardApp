class StudentModel {
  int? id;
  String? name;
  String? image;
  String? department;
  String? idNumber;
  String? study;
  String? expireAt;
  String? studentStatus;
  String? createdAt;
  String? updatedAt;

  StudentModel(
      {this.id,
      this.name,
      this.image,
      this.department,
      this.idNumber,
      this.study,
      this.expireAt,
      this.studentStatus,
      this.createdAt,
      this.updatedAt});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    department = json['department'];
    idNumber = json['id_number'];
    study = json['study'];
    expireAt = json['expire_at'];
    studentStatus = json['student_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['department'] = department;
    data['id_number'] = idNumber;
    data['study'] = study;
    data['expire_at'] = expireAt;
    data['student_status'] = studentStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
