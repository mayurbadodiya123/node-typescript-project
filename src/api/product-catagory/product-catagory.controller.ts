import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import { NotFoundException } from "../../app/error/exception/not-found-error";
import { authenticateJwt } from "../../app/middlewares/jwt-token";
import ProductCatagoryService from "./product-catagory.service";

class ProductCatagoryController extends BaseController<ProductCatagoryService> {
  constructor() {
    super("/catagory", new ProductCatagoryService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.post("/catagory-list", this.list);
    this.router.use(this.path, this.router);
  }

  list = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const catagory = await this.service.findAll(req.body).then().catch();
      res.json(
        ResponseStatus.success(message.category.categoryListSuccess, catagory)
      );
    } catch (error: any) {
      next(error);
    }
  };
}

export default ProductCatagoryController;
