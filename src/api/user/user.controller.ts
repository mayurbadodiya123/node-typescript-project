import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import { User } from "./user.types";
import UserService from "./user.service";
import createAuthenticationSchema from "./user.validator";
import { NotFoundException } from "../../app/error/exception/not-found-error";
import { authenticateJwt } from "../../app/middlewares/jwt-token";
import PostService from "../post/post.service";
import sequelize from "../../app/config/sequelize.config";
class UserController extends BaseController<UserService> {
  postService = new PostService();
  constructor() {
    super("/user", new UserService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.get("/get-profile", this.getdetails);
    this.router.put("/edit-profile", this.update);
    this.router.use(this.path, authenticateJwt, this.router);
  }

  getdetails = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { iUserId } = req.user as any;

      const user = await this.service.findById(iUserId).then().catch();

      if (!user) throw new NotFoundException("User not found");

      res.json(ResponseStatus.success(message.user.getUserSuccess, user));
    } catch (error: any) {
      next(error);
    }
  };

  update = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const userreq = req.body;
      const { iUserId } = req.user as any;
      this.router.use(this.path, authenticateJwt, this.router);
      this.router.use(this.path, authenticateJwt, this.router);

      const user = await this.service.findById(iUserId).then().catch();

      if (!user) throw new NotFoundException("User not found");
      await this.service.update(iUserId, userreq);
      res.json(ResponseStatus.success(message.user.updateUserSuccess, user));
    } catch (error: any) {
      next(error);
    }
  };
}

export default UserController;
