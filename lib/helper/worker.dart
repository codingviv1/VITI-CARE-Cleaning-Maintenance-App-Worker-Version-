
class Worker {
  Worker({
    required this.id,
    required this.Name,
    required this.Block,
    required this.employeeId,
    required this.creditPoints,
    required this.onDuty,
  });
  late String id;
  late String Name;
  late String employeeId;
  late String Block;
  late String creditPoints;
  late bool onDuty;

  Worker.fromJson(Map<String, dynamic> json){
    id=json['id'];
    Name = json['Name'];
    employeeId = json['employeeId'];
    Block = json['Block'];
    creditPoints = json['creditPoints'];
    onDuty = json['onDuty'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id']=id;
    data['Name'] = Name;
    data['employeeId'] = employeeId;
    data['Block'] = Block;
    data['creditPoints'] = creditPoints;
    data['onDuty'] = onDuty;
    return data;
  }
}