import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import { NotFoundException } from "../../app/error/exception/not-found-error";
import { authenticateJwt } from "../../app/middlewares/jwt-token";
import PostService from "../post/post.service";
import sequelize from "../../app/config/sequelize.config";
import ReviewService from "./review.service";
class ReviewController extends BaseController<ReviewService> {
  postService = new PostService();
  constructor() {
    super("/review", new ReviewService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.get("/review-list", this.list);
    this.router.use(this.path, authenticateJwt, this.router);
  }
  list = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const review = await this.service.findAll(req.body).then().catch();
      res.json(ResponseStatus.success(message.post.getPostSuccess, review));
    } catch (error: any) {
      next(error);
    }
  };
}

export default ReviewController;
