import { Request, Response, NextFunction } from "express";

import Joi from "joi";
export default function createAuthenticationSchema(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const schema = !req.params.id
    ? Joi.object({
        vFirstName: Joi.string().required(),
        vLastName: Joi.string().required(),
        vEmail: Joi.string().email().required(),
        vPassword: Joi.string().min(6).required(),
        vConfirmPassword: Joi.string().min(6).required(),
      })
    : Joi.object({
        vFirstName: Joi.string().required(),
        vLastName: Joi.string().required(),
      });

  const options = {
    abortEarly: false,
    allowUnknown: true,
    stripUnknown: true,
  };

  const { error, value } = schema.validate(req.body, options);

  if (error) {
    throw Error(error.details[0].message.replace(/['"]+/g, ""));
  } else {
    req.body = value;
    next();
  }
}
