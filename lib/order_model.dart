class OrderModel {
  // Fields with String type
  String? id;
  String? clientPhoneNumber;
  String? timeOrderDate;
  String? additionalInfo;
  String? nameApartment;
  int? createDate;
  String? dispId;
  String? category;
  String? carType;
  String? paymentType;
  int? startDriveTime;
  int? endDriveTime;
  String? startAddress;
  String? endAddress;
  num? distance;
  num? driveTime;
  num? cost;
  String? clientId;
  String? driverId;
  num? startFare;
  num? kmFare;
  num? timeFare;
  String? status;
  bool? timeOrder;
  String? runTime;
  String? warningTime;
  String? startCoords;
  String? endCoords;
  String? clientSours;
  String? businessClient;
  String? workSessionDriverId;
  String? parkId;
  String? clientName;


  // Constructor
  OrderModel({
    this.id = '',
    this.clientPhoneNumber = '',
    this.timeOrderDate = '',
    this.timeOrder = false,
    this.additionalInfo = '',
    this.nameApartment = '',
    this.createDate = 0,
    this.dispId = '',
    this.category = '',
    this.carType = '',
    this.paymentType = '',
    this.startDriveTime = 0,
    this.endDriveTime = 0,
    this.startAddress = '',
    this.endAddress = '',
    this.distance = 0,
    this.driveTime = 0,
    this.cost = 0,
    this.clientId = '',
    this.driverId = '',
    this.startFare = 0,
    this.kmFare = 0,
    this.timeFare = 0,
    this.status = '',
    this.runTime ='',
    this.warningTime='',
    this.startCoords='',
    this.endCoords='',
    this.clientSours='',
    this.businessClient='',
    this.workSessionDriverId='',
    this.parkId='',
    this.clientName='',
  });

  // Method to convert to Firestore
  Map<String, dynamic> toFirestore(id) {
    return {
      'id': id,
      'nameApartment': nameApartment ?? '',
      'timeOrderDate': timeOrderDate ?? '',
      'timeOrder': timeOrder ?? '',
      'additionalInfo': additionalInfo ?? '',
      'clientPhoneNumber': clientPhoneNumber ?? '',
      'createDate': createDate ?? 0,
      'status': status ?? '',
      'dispId': dispId ?? '',
      'category': category ?? '',
      'carType': carType ?? '',
      'paymentType': paymentType ?? '',
      'startDriveTime': startDriveTime ?? '',
      'endDriveTime': endDriveTime ?? '',
      'startAddress': startAddress ?? '',
      'endAddress': endAddress ?? '',
      'distance': distance ?? 0,
      'driveTime': driveTime ?? 0,
      'cost': cost ?? 0,
      'clientId': clientId ?? '',
      'driverId': driverId ?? '',
      'startFare': startFare ?? 0,
      'kmFare': kmFare ?? 0,
      'timeFare': timeFare ?? 0,
      'runTime': runTime ?? '',
      'warningTime': warningTime ?? '',
      'startCoords': startCoords ?? '',
      'endCoords': endCoords ?? '',
      'clientSours': clientSours ?? '',
      'businessClient': businessClient ?? '',
      'workSessionDriverId': workSessionDriverId ?? '',
      'parkId': parkId ?? '',
      'clientName': clientName ?? '',
    };
  }

  // Method to convert from Firestore
  static OrderModel fromFirestore(Map<String, dynamic> firestore) {
    return OrderModel(
      id: firestore['id'] as String,
      clientPhoneNumber: firestore['clientPhoneNumber']as String,
      timeOrderDate: firestore['timeOrderDate']as String,
      timeOrder: firestore['timeOrder']as bool,
      additionalInfo: firestore['additionalInfo']as String,
      nameApartment: firestore['nameApartment']as String,
      status: firestore['status']as String,
      createDate: firestore['createDate']as int,
      dispId: firestore['dispId']as String,
      category: firestore['category']as String,
      carType: firestore['carType']as String,
      paymentType: firestore['paymentType']as String,
      startDriveTime: firestore['startDriveTime']as int,
      endDriveTime: firestore['endDriveTime']as int,
      startAddress: firestore['startAddress']as String,
      endAddress: firestore['endAddress']as String,
      distance: firestore['distance'] as num,
      driveTime: firestore['driveTime']as num,
      cost: firestore['cost']as num,
      clientId: firestore['clientId']as String,
      driverId: firestore['driverId']as String,
      startFare: firestore['startFare']as num,
      kmFare: firestore['kmFare']as num,
      timeFare: firestore['timeFare']as num,
      runTime: firestore['runTime']as String,
      warningTime: firestore['warningTime']as String,
      startCoords: firestore['startCoords']as String,
      endCoords: firestore['endCoords']as String,
      clientSours: firestore['clientSours']as String,
      businessClient: firestore['businessClient']as String,
      workSessionDriverId: firestore['workSessionDriverId']as String,
      parkId: firestore['parkId']as String,
      clientName: firestore['clientName']as String,
    );
  }

  OrderModel copyWith({
    String? id,
    String? nameApartment,
    String? callLine,
    String? timeOrderDate,
    bool? timeOrder,
    bool? active,
    String? additionalInfo,
    String? clientPhoneNumber,
    String? status,
    int? createDate,
    String? dispatcher,
    String? dispId,
    String? callOwner,
    String? category,
    String? carType,
    String? paymentType,
    int? startDriveTime,
    int? endDriveTime,
    String? startAddress,
    String? endAddress,
    num? distance,
    num? driveTime,
    num? cost,
    String? clientId,
    String? driverId,
    String? runTime,
    String? warningTime,
    num? startFare,
    num? kmFare,
    num? timeFare,
    List? logs,
    List? driveMarkers,
    String? startCoords,
    String? endCoords,
    String? clientSours,
    String? businessClient,
    String? workSessionDriverId,
    String? parkId,
    String? clientName,
  }) {
    return OrderModel(
      id: id ?? this.id,
      timeOrder: timeOrder ?? this.timeOrder,
      timeOrderDate: timeOrderDate ?? this.timeOrderDate,
      nameApartment: nameApartment ?? this.nameApartment,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      clientPhoneNumber: clientPhoneNumber ?? this.clientPhoneNumber,
      createDate: createDate ?? this.createDate,
      status: status ?? this.status,
      dispId: dispId ?? this.dispId,
      category: category ?? this.category,
      carType: carType ?? this.carType,
      paymentType: paymentType ?? this.paymentType,
      startDriveTime: startDriveTime ?? this.startDriveTime,
      endDriveTime: endDriveTime ?? this.endDriveTime,
      startAddress: startAddress ?? this.startAddress,
      endAddress: endAddress ?? this.endAddress,
      distance: distance ?? this.distance,
      driveTime: driveTime ?? this.driveTime,
      cost: cost ?? this.cost,
      clientId: clientId ?? this.clientId,
      driverId: driverId ?? this.driverId,
      startFare: startFare ?? this.startFare,
      kmFare: kmFare ?? this.kmFare,
      timeFare: timeFare ?? this.timeFare,
      runTime: runTime ?? this.runTime,
      warningTime: warningTime ?? this.warningTime,
      startCoords: startCoords ?? this.startCoords,
      endCoords: endCoords ?? this.endCoords,
      clientSours: clientSours ?? this.clientSours,
      businessClient: businessClient ?? this.businessClient,
      workSessionDriverId: workSessionDriverId ?? this.workSessionDriverId,
      parkId: parkId ?? this.parkId,
      clientName: clientName ?? this.clientName,
    );
  }
}
