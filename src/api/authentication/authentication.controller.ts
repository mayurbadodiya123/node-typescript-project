import { Request, Response, NextFunction } from "express";
import { BaseController } from "./../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import AuthService from "./authentication.service";
import {
  comparePassword,
  generateOtp,
  getJwtToken,
  decodeJwtToken,
} from "../../app/utils/app.util";
import createAuthenticationSchema from "./authentication.validator";
var nodemailer = require("nodemailer");

class AuthenctionController extends BaseController<AuthService> {
  constructor() {
    super("/auth", new AuthService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.post("/login", this.login);
    this.router.post("/register", createAuthenticationSchema, this.register);
    this.router.post("/forget-password", this.forgetPassword);
    this.router.post("/change-password", this.changePassword);
    this.router.post("/reset-password", this.resetPassword);

    this.router.use(this.path, this.router);
  }

  login = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { email, password } = req.body.params;

      const user = await this.service.find(email).then().catch();

      if (!user) throw Error("User not found");

      const isPasswordValid = await comparePassword(user.vPassword, password);

      if (!isPasswordValid) throw Error("Invalid login credential");

      const token = getJwtToken(user.iUserId);

      res.json(
        ResponseStatus.success(message.authentication.loginSuccess, {
          token,
        })
      );
    } catch (error: any) {
      next(error);
    }
  };

  register = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const userReq = req.body;

      const isEmailExist = await this.service.find(userReq.vEmail);

      if (isEmailExist) throw Error("Email already exist");

      const user = await this.service.register(userReq).then().catch();
      res.json(
        ResponseStatus.success(message.authentication.signupSuccess, user)
      );
    } catch (error: any) {
      next(error);
    }
  };

  forgetPassword = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const user = await this.service.find(req.body.email);

      if (!user) throw Error("This email is not exist");

      // const token = crypto.randomBytes(32).toString("hex");
      const token = getJwtToken(user.iUserId);

      const otp = generateOtp();

      const data = {
        iUserId: user.iUserId,
        vToken: token,
        vOTP: otp,
      };

      const isForgetPasswordExist = await this.service.findForgetPassowrd(
        user.iUserId
      );
      let result = !isForgetPasswordExist
        ? await this.service.addToken(data)
        : await this.service.updateToken(data);

      if (!result) throw Error("Something went wrong");

      res.json(
        ResponseStatus.success(message.authentication.tokenSendSuccess, {})
      );
    } catch (error) {
      next(error);
    }
  };

  changePassword = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { vNewPassword, vOldPassword } = req.body;
      const userDetails = await decodeJwtToken(req.header("authorization")!);

      const user = await this.service
        .getUserById(userDetails?.iUserId)
        .then()
        .catch();

      if (!user) throw Error("User not found");

      const isPasswordValid = await comparePassword(
        user.vPassword,
        vOldPassword
      );

      if (!isPasswordValid) throw Error("Your old password is invalid");

      const result = await this.service.updateResetPassword(
        user.iUserId,
        vNewPassword
      );

      if (!result) throw Error("Something went wrong");

      res.json(
        ResponseStatus.success(
          message.authentication.passwordUpdatedSuccessfully,
          {}
        )
      );
    } catch (error) {
      next(error);
    }
  };

  resetPassword = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const user = await this.service.getIdByToken(req.body);
      if (!user) throw Error(message.authentication.wrongOtpError);

      const result = await this.service.updateResetPassword(
        user.iUserId,
        req.body.vPassword
      );

      if (!result) throw Error("Something went wrong");
      const userDelete = await this.service.deleteForgetPassword(user.iUserId);

      res.json(
        ResponseStatus.success(
          message.authentication.passwordUpdatedSuccessfully,
          {}
        )
      );
    } catch (error) {
      next(error);
    }
  };
}

export default AuthenctionController;
