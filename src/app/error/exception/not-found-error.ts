export class NotFoundException extends Error {
  statusCode = 404;
  isOperational: boolean;

  constructor(message: string | undefined, isOperational = true, stack = "") {
    super(message);
    this.isOperational = isOperational;
    if (stack) {
      this.stack = stack;
    } else {
      Error.captureStackTrace(this, this.constructor);
    }
  }
}
