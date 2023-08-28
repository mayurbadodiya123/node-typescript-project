import { Op } from "sequelize";
import BaseService from "../../app/base/base.service";
import User from "../../database/models/User";
import Product from "../../database/models/Product";
import ProductCatagory from "../../database/models/ProductCatagory";
import ProductImage from "../../database/models/ProductImage";

class ProductService extends BaseService<typeof Product> {
  constructor() {
    super(Product);
  }

  async findById(id: number | string): Promise<Product> {
    return await this.m.findOne({
      where: { iProductId: id },
      include: [{ model: ProductCatagory }, { model: ProductImage }],
    });
  }

  async findAll(body: any): Promise<Product[]> {
    let filter = body.filter.category;
    let keyword = body.keyword;

    let externalWhereCond = {
      [Op.or]: [
        { vProductTitle: { [Op.substring]: `%${keyword}%` } },
        { iProductCategory: { [Op.eq]: `${filter}` } },
      ],
    };

    let sort: any[] = body.sort;
    if (filter || keyword) {
      return await this.m.findAll({
        limit: body.limit,
        offset: body.offset,
        where: { ...externalWhereCond } || {},
        order: sort,
        include: [{ model: ProductImage }],
      });
    } else {
      return await this.m.findAll({
        limit: body.limit,
        offset: body.offset,
        order: sort,
        include: [{ model: ProductImage }],
      });
    }
  }

  async create(product: Product): Promise<Product> {
    // user.vPassword = await encryptPassword(user.vPassword);
    return await this.m.create(product);
  }

  async update(id: number | string, data: Product): Promise<Product> {
    return await this.m.update(data, { where: { iProductId: id } });
  }

  async delete(id: number | string): Promise<Product> {
    return await this.m.destroy({ where: { iProductId: id } });
  }

  async checkEmail(vEmail: String): Promise<User> {
    return await this.m.findOne({ where: { vEmail: vEmail } });
  }
}

export default ProductService;
