import { Request, Response, NextFunction } from "express";
import { BaseController } from "./../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import CartService from "./cart.service";
import { authenticateJwt } from "../../app/middlewares/jwt-token";
import { NotFoundException } from "../../app/error/exception/not-found-error";

type CartType = {
  iProductId: number;
  iQuantity: number;
};

class CartController extends BaseController<CartService> {
  constructor() {
    super("/cart", new CartService());
    this.intializeRoutes();
  }
  public intializeRoutes(): void {
    this.router.post("/add", this.register);
    this.router.post("/add-cart", this.get);

    this.router.use(this.path, authenticateJwt, this.router);
  }
  register = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { iProductId, iQuantity } = req.body as CartType;
      const { iUserId } = req.user as any;
      const cart = await this.service
        .register({ iProductId, iQuantity, iUserId })
        .then()
        .catch();
      res.json(
        ResponseStatus.success(message.cart.addProductToCartSuccess, cart)
      );
    } catch (error: any) {
      next(error);
    }
  };

  get = async (req: Request, res: Response, next: NextFunction) => {
    const { iUserId } = req.user as any;
    try {
      const cart = await this.service.findById(iUserId).then().catch();
      if (!cart) throw new NotFoundException("No product in the cart");

      res.json(ResponseStatus.success(message.product.getProductSuccess, cart));
    } catch (error: any) {
      next(error);
    }
  };
}
export default CartController;
