import BaseService from "../../app/base/base.service";
import sequelize from "../../app/config/sequelize.config";
import Slider from "../../database/models/Slider";
import User from "../../database/models/User";

class SliderService extends BaseService<typeof Slider> {
  constructor() {
    super(Slider);
  }

  async findAll(body: any): Promise<Slider> {
    return await this.m.findAll();
  }
}

export default SliderService;
