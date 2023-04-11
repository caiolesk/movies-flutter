class SeverException implements Exception {
  final String message;

  SeverException(this.message);
}

class ParseDataException implements Exception {
  final String message;

  const ParseDataException(this.message);
}
