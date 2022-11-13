import { ArgumentsHost, Catch, ExceptionFilter } from '@nestjs/common';
import { Response } from 'express';
import { ValueException } from '../exceptions/value.exception';

@Catch(ValueException)
export class ValueExceptionFilter implements ExceptionFilter {
  catch(exception: ValueException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    const status = 400;

    response.status(status).json({
      statusCode: status,
      message: exception.message,
      error: 'Bad Request',
    });
  }
}
