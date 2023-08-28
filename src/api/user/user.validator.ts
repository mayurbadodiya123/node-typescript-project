import { Request, Response, NextFunction } from "express";
import Joi from "joi";
import { BadRequestException } from "../../app/error/exception/bad-request-error";
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
        vPhoneNumber: Joi.string().min(10).required(),
        dDateOfBirth: Joi.date().required(),
        eStatus: Joi.string().required(),
      })
    : Joi.object({
        vFirstName: Joi.string().required(),
        vLastName: Joi.string().required(),
        vPhoneNumber: Joi.string().min(10).required(),
        dDateOfBirth: Joi.date().required(),
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
