import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import { NotFoundException } from "../../app/error/exception/not-found-error";
import { authenticateJwt } from "../../app/middlewares/jwt-token";
import sequelize from "../../app/config/sequelize.config";
import ProductService from "./product.service";
class ProductController extends BaseController<ProductService> {
  constructor() {
    super("/product", new ProductService());
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
    const { id } = req.params;
    try {
      const product = await this.service.findById(id).then().catch();
      if (!product) throw new NotFoundException("Product not found");

      res.json(
        ResponseStatus.success(message.product.getProductSuccess, product)
      );
    } catch (error: any) {
      next(error);
    }
  };

  list = async (req: Request, res: Response, next: NextFunction) => {
    const keyword = req.body.keyword || "";
    const category = req.body.filter.category || "";

    try {
      const product = await this.service.findAll(req.body).then().catch();
      if (!product) throw new NotFoundException("Product not found");
      res.json(
        ResponseStatus.success(message.product.ProductListSuccess, product)
      );
    } catch (error: any) {
      next(error);
    }
  };

  create = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const productReq = req.body;

      // const isEmailExist = await this.service.checkEmail(req.body.vEmail);

      // if (isEmailExist) throw Error("Email already exist");

      const product = await this.service.create(productReq).then().catch();

      if (!product) throw Error("Something went wrong");

      res.json(
        ResponseStatus.success(message.product.addProductSuccess, product)
      );
    } catch (error: any) {
      next(error);
    }
  };

  update = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const productReq = req.body;

      const product = await this.service.findById(req.params.id).then().catch();

      if (!product) throw new NotFoundException("Product not found");
      await this.service.update(req.params.id, productReq);
      console.log("update successfull");
      res.json(
        ResponseStatus.success(message.product.updateProductSuccess, product)
      );
    } catch (error: any) {
      next(error);
    }
  };

  delete = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const product = await this.service.findById(req.params.id).then().catch();
      if (!product) throw new NotFoundException("Product not found");
      await this.service.delete(req.params.id).then().catch();
      res.json(
        ResponseStatus.success(message.product.deleteProductSuccess, "")
      );
    } catch (error: any) {
      next(error);
    }
  };
}

export default ProductController;
