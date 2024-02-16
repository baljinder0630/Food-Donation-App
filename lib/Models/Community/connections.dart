class Connections {
  String userId;
  ConnectionStatus status;
  Connections({required this.userId, required this.status});
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'status': status.toString().split('.').last,
    };
  }

  factory Connections.fromMap(Map<String, dynamic> map) {
    return Connections(
      userId: map['userId'],
      status: ConnectionStatus.values.firstWhere(
          (e) => e.toString() == 'ConnectionStatus.' + map['status']),
    );
  }
}

enum ConnectionStatus { initial, pending, accepted, rejected }
