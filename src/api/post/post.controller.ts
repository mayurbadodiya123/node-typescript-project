import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import { Post } from "./post.types";
import PostService from "./post.service";
import { NotFoundException } from "../../app/error/exception/not-found-error";
import { authenticateJwt } from "../../app/middlewares/jwt-token";

class PostController extends BaseController<PostService> {
  constructor() {
    super("/post", new PostService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.get("/:id", this.get);
    this.router.post("/list", this.list);
    this.router.post("/create", this.create);
    this.router.put("/:id", this.update);
    this.router.delete("/:id", this.delete);
    this.router.use(this.path, authenticateJwt, this.router);
  }

  get = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const post = await this.service.findById(req.params.id).then().catch();
      if (!post) throw new NotFoundException("Post not found");

      res.json(ResponseStatus.success(message.post.getPostSuccess, post));
    } catch (error: any) {
      next(error);
    }
  };

  list = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const post = await this.service.findAll(req.body).then().catch();
      res.json(ResponseStatus.success(message.post.getPostSuccess, post));
    } catch (error: any) {
      next(error);
    }
  };

  create = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const postReq = req.body;
      const post = await this.service.create(postReq).then().catch();
      if (!post) throw Error("Something went wrong");

      res.json(ResponseStatus.success(message.post.addPostSuccess, post));
    } catch (error: any) {
      next(error);
    }
  };

  update = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const postReq = req.body;
      const user = await this.service.findById(req.params.id).then().catch();
      if (!user) throw new NotFoundException("Post not found");

      const post = await this.service
        .update(req.params.id, postReq)
        .then()
        .catch();

      res.json(ResponseStatus.success(message.post.updatePostSuccess, post));
    } catch (error: any) {
      next(error);
    }
  };

  delete = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const user = await this.service.findById(req.params.id).then().catch();
      if (!user) throw new NotFoundException("Post not found");
      const post = await this.service.delete(req.params.id).then().catch();
      res.json(ResponseStatus.success(message.post.deletePostSuccess, post));
    } catch (error: any) {
      next(error);
    }
  };
}

export default PostController;
