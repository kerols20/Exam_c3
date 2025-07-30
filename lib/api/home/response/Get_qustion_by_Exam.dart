import 'package:json_annotation/json_annotation.dart';

import '../../../domin/home/model/Get_qustion_by_Exam_Id_model.dart';

part 'Get_qustion_by_Exam.g.dart';

@JsonSerializable()
class Get_qustion_by_Exam_id {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<Questions>? questions;

  Get_qustion_by_Exam_id ({
    this.message,
    this.questions,
  });

  factory Get_qustion_by_Exam_id.fromJson(Map<String, dynamic> json) {
    return _$Get_qustion_by_Exam_idFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Get_qustion_by_Exam_idToJson(this);
  }
}

@JsonSerializable()
class Questions {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "answers")
  final List<Answers>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final Subject? subject;
  @JsonKey(name: "exam")
  final Exam? exam;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Questions ({
    this.Id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return _$QuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsToJson(this);
  }
  Get_qustion_by_Exam_Id_model toModel() {
    return Get_qustion_by_Exam_Id_model(
      qustion: question!,
      Answer: answers!.map((e) => e.answer!).toList(),
      correct: correct!,
      key: answers!.firstWhere((element) => element.key == correct).answer!,
      icon: subject!.icon!,
      subject: subject!.name!,
      exam: exam!.title!,
      createdAt: createdAt!,
    );
  }
}

@JsonSerializable()
class Answers {
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "key")
  final String? key;

  Answers ({
    this.answer,
    this.key,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }
}

@JsonSerializable()
class Subject {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Subject ({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return _$SubjectFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectToJson(this);
  }
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Exam ({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return _$ExamFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamToJson(this);
  }
}


