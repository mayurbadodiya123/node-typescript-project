import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import StaticPageService from "./static-pages.service";

class StaticPagesController extends BaseController<StaticPageService> {
  constructor() {
    super("/pages", new StaticPageService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.post("/static-page", this.get);
    this.router.use(this.path, this.router);
  }

  get = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const staticPage = await this.service
        .findByCode(req.body.code)
        .then()
        .catch();
      res.json(ResponseStatus.success(message.staticPages.get, staticPage));
    } catch (error: any) {
      next(error);
    }
  };
}

export default StaticPagesController;
