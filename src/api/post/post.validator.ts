import { Request, Response, NextFunction } from "express";
import { BadRequestException } from "../../app/error/exception/bad-request-error";

import Joi from "joi";
export default function createAuthenticationSchema(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const schema = !req.params.id
    ? Joi.object({
        vTitle: Joi.string().required(),
        vType: Joi.string().required(),
        vUrl: Joi.string().email().required(),
        iUserId: Joi.string().min(6).required(),
      })
    : Joi.object({
        vTitle: Joi.string().required(),
        vType: Joi.string().required(),
        iUserId: Joi.string().min(10).required(),
      });

  const options = {
    abortEarly: false,
    allowUnknown: true,
    stripUnknown: true,
  };

  const { error, value } = schema.validate(req.body, options);

  if (error) {
    throw new BadRequestException(
      error.details[0].message.replace(/['"]+/g, "")
    );
  } else {
    req.body = value;
    next();
  }
}
