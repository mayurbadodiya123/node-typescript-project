import { ExtractJwt } from "passport-jwt";
import { APP_CONFIG } from "./app.config";
const JwtStrategy = require("passport-jwt").Strategy;

const jwtOptions = {
  secretOrKey: String(process.env.JWT_SECRET),
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
};

const jwtVerify = async (payload: any, done: any) => {
  try {
    done(null, payload);
  } catch (error) {
    done(error, false);
  }
};

export const jwtStrategy = new JwtStrategy(jwtOptions, jwtVerify);
