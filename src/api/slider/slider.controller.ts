import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import SliderService from "./slider.service";
import { NotFoundException } from "../../app/error/exception/not-found-error";
import { authenticateJwt } from "../../app/middlewares/jwt-token";

class SliderController extends BaseController<SliderService> {
  constructor() {
    super("/slider", new SliderService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.post("/list", this.list);

    this.router.use(this.path, this.router);
  }

  list = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const Slider = await this.service.findAll(req.body).then().catch();
      res.json(ResponseStatus.success(message.slider.list, Slider));
    } catch (error: any) {
      next(error);
    }
  };
}

export default SliderController;
