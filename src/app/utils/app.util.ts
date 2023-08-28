import bcrypt from "bcrypt";
import otpGenerator from "otp-generator";
import { APP_CONFIG } from "../config/app.config";
import jwt from "jsonwebtoken";

export const encryptPassword = async (password: string): Promise<string> => {
  const saltRound = 10;
  return await bcrypt.hash(password, saltRound);
};

export const comparePassword = async (
  encreptedPassword: string,
  password: string
): Promise<boolean> => {
  return await bcrypt.compareSync(password, encreptedPassword);
};

export const getJwtToken = (id: number | string): string => {
  return jwt.sign({ iUserId: id }, String(APP_CONFIG.JWT_SECRET), {
    expiresIn: APP_CONFIG.JWT_EXPIRE_TIME,
  });
};

export const decodeJwtToken = (token: string): any => {
  const prepareToken = token.replace("Bearer ", "");
  return jwt.verify(prepareToken, APP_CONFIG.JWT_SECRET);
};

export const generateOtp = () => {
  return otpGenerator.generate(6, {
    upperCaseAlphabets: false,
    specialChars: false,
    digits: true,
    lowerCaseAlphabets: false,
  });
};

export const getTimeDifference = (time: string) => {
  let currentTime = new Date();
  let createdTime = new Date(time);
  var timeDiff = currentTime.getTime() - createdTime.getTime();

  var timeDiffSec = timeDiff / 1000;
  if (timeDiffSec / 60 < 1) {
    return timeDiffSec + " Sec";
  }
  if (timeDiffSec / 60 >= 1 && timeDiffSec / 3600 < 1) {
    return Math.ceil(timeDiffSec / 60) + " Min";
  }

  if (timeDiffSec / 3600 >= 1 && timeDiffSec / 86400 < 1) {
    return Math.ceil(timeDiffSec / 3600) + " Hour";
  }
  if (timeDiffSec / 86400 >= 1 && timeDiffSec / 86400 < 1) {
    return Math.ceil(timeDiffSec / 86400) + " Day";
  }
  if (timeDiffSec / 604800 >= 1) {
    return Math.ceil(timeDiffSec / 604800) + " Week";
  }
};
