import { ValueException } from '../exceptions/value.exception';

/**
 * Check whether a value is undefined or not.
 * Throws ValueException if value is undefined.
 * @param value Value to be checked
 * @param message Exception message
 */
export function checkUndefined(value: unknown, message: string) {
  if (typeof value === 'undefined') {
    throw new ValueException(message || `Value is required`);
  }
}
