import { Request, Response, NextFunction } from "express";
import Joi from "joi";
import { BadRequestException } from "../../app/error/exception/bad-request-error";
export const createFaqSchema = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const schema = Joi.object({
    vFaqTitle: Joi.string().max(100).required(),
    tDescription: Joi.string().max(3000).required(),
    eStatus: Joi.string().valid("Active", "Inactive"),
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
};

export const updateFaqSchema = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const schema = Joi.object({
    vFaqTitle: Joi.string().max(100).required(),
    tDescription: Joi.string().max(3000).required(),
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
};
