abstract class TVMazeError {
  final String message;
  final String? code;
  final String? stackTrace;

  TVMazeError(this.message, {this.code, this.stackTrace});
}

class TVMazeServerError extends TVMazeError {
  TVMazeServerError(super.message, {super.code, super.stackTrace});
}

class TVMazeNetworkError extends TVMazeError {
  TVMazeNetworkError(super.message, {super.code, super.stackTrace});
}

class TVMazeUnknownError extends TVMazeError {
  TVMazeUnknownError(super.message, {super.code, super.stackTrace});
}
