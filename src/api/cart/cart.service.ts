import BaseService from "../../app/base/base.service";
import Cart from "../../database/models/Cart";
import Product from "../../database/models/Product";
import ProductImage from "../../database/models/ProductImage";

class CartService extends BaseService<typeof Cart> {
  constructor() {
    super(Cart);
  }
  async register(cart: any): Promise<Cart> {
    return await this.m.create(cart);
  }
  async findById(id: number | string): Promise<Cart> {
    return await this.m.findAndCountAll({
      where: { iUserId: id },
      include: [{ model: Product }],
    });
  }
}
export default CartService;
