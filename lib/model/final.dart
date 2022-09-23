class FinalModel {
  String? code;
  String? message;
  List<Data>? data;

  FinalModel({this.code, this.message, this.data});

  FinalModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? examDate;
  String? examStartTime;
  String? examEndTime;
  String? examSubject;
  String? examGrade;

  Data(
      {this.id,
        this.examDate,
        this.examStartTime,
        this.examEndTime,
        this.examSubject,
        this.examGrade});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examDate = json['examDate'];
    examStartTime = json['examStartTime'];
    examEndTime = json['examEndTime'];
    examSubject = json['examSubject'];
    examGrade = json['examGrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['examDate'] = this.examDate;
    data['examStartTime'] = this.examStartTime;
    data['examEndTime'] = this.examEndTime;
    data['examSubject'] = this.examSubject;
    data['examGrade'] = this.examGrade;
    return data;
  }
}