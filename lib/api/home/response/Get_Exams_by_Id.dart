import 'package:json_annotation/json_annotation.dart';

import '../../../domin/home/model/Get_Exams_by_Id_subject_model.dart';

part 'Get_Exams_by_Id.g.dart';

@JsonSerializable()
class Get_Exams_by_Id_subject {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "exams")
  final List<Exams>? exams;

  Get_Exams_by_Id_subject ({
    this.message,
    this.metadata,
    this.exams,
  });

  factory Get_Exams_by_Id_subject.fromJson(Map<String, dynamic> json) {
    return _$Get_Exams_by_Id_subjectFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Get_Exams_by_Id_subjectToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Exams {
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

  Exams ({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exams.fromJson(Map<String, dynamic> json) {
    return _$ExamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsToJson(this);
  }
  Get_Exams_by_Id_subject_model toModel() {
    return Get_Exams_by_Id_subject_model(
      id: Id!,
      title: title!,
      duration: duration!,
      subject: subject!,
      numberOfQuestions: numberOfQuestions!,
      active: active!,
      createdAt: createdAt!,
    );
  }
}


