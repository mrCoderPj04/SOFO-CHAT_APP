enum UserStatus { online, away, busy, dnd, offline }

class UserModel {
  final String id;
  final String employeeId;
  final String email;
  final String fullName;
  final String designation;
  final String avatarUrl;
  final String? departmentName;
  final UserStatus status;

  UserModel({
    required this.id,
    required this.employeeId,
    required this.email,
    required this.fullName,
    required this.designation,
    required this.avatarUrl,
    this.departmentName,
    this.status = UserStatus.online,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      employeeId: json['employeeId'] ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '${json['firstName'] ?? ''} ${json['lastName'] ?? ''}'.trim(),
      designation: json['designation'] ?? 'Agent',
      avatarUrl: json['avatarUrl'] ?? 'https://ui-avatars.com/api/?name=User',
      departmentName: json['departmentName'],
      status: UserStatus.online,
    );
  }
}

class MessageModel {
  final String id;
  final String conversationId;
  final UserModel sender;
  final String content;
  final DateTime createdAt;

  MessageModel({
    required this.id,
    required this.conversationId,
    required this.sender,
    required this.content,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] ?? '',
      conversationId: json['conversationId'] ?? '',
      sender: UserModel.fromJson(json['sender'] ?? {}),
      content: json['content'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }
}

class MeetingModel {
  final String id;
  final String meetingCode;
  final String title;
  final String? agenda;
  final int durationMinutes;
  final UserModel host;

  MeetingModel({
    required this.id,
    required this.meetingCode,
    required this.title,
    this.agenda,
    required this.durationMinutes,
    required this.host,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    return MeetingModel(
      id: json['id'] ?? '',
      meetingCode: json['meetingCode'] ?? '',
      title: json['title'] ?? 'Meeting',
      agenda: json['agenda'],
      durationMinutes: json['durationMinutes'] ?? 30,
      host: UserModel.fromJson(json['host'] ?? {}),
    );
  }
}
