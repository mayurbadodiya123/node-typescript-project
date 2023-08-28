import { Request, Response, NextFunction } from "express";
import passport from "passport";
import { UnauthorizedException } from "../error/exception/unauthorized-error";

export const authenticateJwt = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  passport.authenticate("jwt", (err, user) => {
    if (err) return next(err);
    if (!user) throw new UnauthorizedException("Unauthorized");
    req.user = user;
    next();
  })(req, res, next);
};
