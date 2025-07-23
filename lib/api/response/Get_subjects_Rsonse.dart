import 'package:json_annotation/json_annotation.dart';

import '../../domin/model/Get_subjects_model.dart';

part 'Get_subjects_Rsonse.g.dart';

@JsonSerializable()
class Get_subjects_Rsonse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "subjects")
  final List<Subjects>? subjects;
  Get_subjects_Rsonse ({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory Get_subjects_Rsonse.fromJson(Map<String, dynamic> json) {
    return _$Get_subjects_RsonseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Get_subjects_RsonseToJson(this);
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
class Subjects {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Subjects ({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory Subjects.fromJson(Map<String, dynamic> json) {
    return _$SubjectsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsToJson(this);
  }
  subject toSubject(){
    return subject(
      id: Id!,
      name: name!,
      icon: icon!,
      createdAt: createdAt!,
    );
  }
}


