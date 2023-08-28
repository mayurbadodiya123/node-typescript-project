import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import { Faq } from "./faq.types";
import FaqService from "./faq.service";
import { NotFoundException } from "../../app/error/exception/not-found-error";
import { authenticateJwt } from "../../app/middlewares/jwt-token";
import { createFaqSchema, updateFaqSchema } from "./faq.validator";

class FaqController extends BaseController<FaqService> {
  constructor() {
    super("/faq", new FaqService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.get("/:id", this.get);
    this.router.post("/list", authenticateJwt, this.list);
    this.router.post(
      "/create",
      [authenticateJwt, createFaqSchema],
      this.create
    );
    this.router.put("/:id", [authenticateJwt, updateFaqSchema], this.update);
    this.router.delete("/:id", authenticateJwt, this.delete);
    this.router.use(this.path, this.router);
  }

  get = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const faq = await this.service.findById(req.params.id).then().catch();
      if (!faq) throw new NotFoundException("Faq not found");

      res.json(ResponseStatus.success(message.faq.get, faq));
    } catch (error: any) {
      next(error);
    }
  };

  list = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const faq = await this.service.findAll(req.body).then().catch();
      res.json(ResponseStatus.success(message.faq.list, faq));
    } catch (error: any) {
      next(error);
    }
  };

  create = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const faqReq = req.body;
      const faq = await this.service.create(faqReq).then().catch();
      if (!faq) throw Error("Something went wrong");

      res.json(ResponseStatus.success(message.faq.create, faq));
    } catch (error: any) {
      next(error);
    }
  };

  update = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const faqReq = req.body;
      const isFaq = await this.service.findById(req.params.id).then().catch();
      if (!isFaq) throw new NotFoundException("Faq not found");

      const faq = await this.service
        .update(req.params.id, faqReq)
        .then()
        .catch();

      res.json(ResponseStatus.success(message.faq.update, faq));
    } catch (error: any) {
      next(error);
    }
  };

  delete = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const isFaq = await this.service.findById(req.params.id).then().catch();
      if (!isFaq) throw new NotFoundException("Faq not found");
      const faq = await this.service.delete(req.params.id).then().catch();
      res.json(ResponseStatus.success(message.faq.delete, faq));
    } catch (error: any) {
      next(error);
    }
  };
}

export default FaqController;
