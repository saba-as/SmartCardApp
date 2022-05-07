class HttpResponse<T> {
  final bool? isSuccessful;
  final T? data;
  final String? message;
  final int? responseCode;

  const HttpResponse(
      {this.isSuccessful, this.data, this.message, this.responseCode});
}
