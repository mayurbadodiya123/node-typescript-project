import BaseService from "../../app/base/base.service";
import { encryptPassword } from "../../app/utils/app.util";
import ProductCatagory from "../../database/models/ProductCatagory";

class ProductCatagoryService extends BaseService<typeof ProductCatagory> {
  constructor() {
    super(ProductCatagory);
  }
  async findAll(body: any): Promise<ProductCatagory> {
    return await this.m.findAll();
  }
}

export default ProductCatagoryService;
