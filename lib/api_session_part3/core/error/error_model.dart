class ErrorModel {
  final String errorMessage;
  final int status;

  ErrorModel({required this.errorMessage, required this.status});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
        errorMessage: jsonData['errorMessage'], status: jsonData['status']);
  }
}
