import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import ContactUservice from "./contact-us.service";

class ContactUsController extends BaseController<ContactUservice> {
  constructor() {
    super("/contact-us", new ContactUservice());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.post("/", this.create);
    this.router.use(this.path, this.router);
  }

  create = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const contactUsReq = req.body;
      const contactUs = await this.service.create(contactUsReq).then().catch();
      if (!contactUs) throw Error("Something went wrong");

      res.json(ResponseStatus.success(message.contactUs.create, contactUs));
    } catch (error: any) {
      next(error);
    }
  };
}

export default ContactUsController;
