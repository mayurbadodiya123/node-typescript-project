import { Op } from "sequelize";
import BaseService from "../../app/base/base.service";
import { encryptPassword } from "../../app/utils/app.util";
import Review from "../../database/models/Review";
import sequelize from "../../app/config/sequelize.config";

class ReviewService extends BaseService<typeof Review> {
  constructor() {
    super(Review);
  }

  async findAll(body: any): Promise<Review[]> {
    // let filter = body.filter;

    // let externalWhereCond = {
    //   [Op.or]: [{ vProductTitle: { [Op.like]: `%${body.keyword}%` } }],
    // };
    // console.log("body.keyword is  : ", body.keyword);
    // let sort: any[] = body.sort;

    return await this.m.findAndCountAll({
      //   limit: body.limit,
      //   offset: body.offset,
      //   where: { ...externalWhereCond, ...filter } || {},
      //   order: sort,
    });
  }
}

export default ReviewService;
