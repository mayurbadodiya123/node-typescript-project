import BaseService from "../../app/base/base.service";
import Faq from "../../database/models/Faq";
class FaqService extends BaseService<typeof Faq> {
  constructor() {
    super(Faq);
  }

  async findById(id: number | string): Promise<any> {
    return await this.m.findOne({ where: { iFaqId: id } });
  }

  async findAll(body: any): Promise<Faq> {
    return await this.m.findAll();
  }

  async create(faq: Faq): Promise<Faq> {
    return await this.m.create(faq);
  }

  async update(id: number | string, data: Faq): Promise<Faq> {
    return await this.m.update(data, { where: { iFaqId: id } });
  }

  async delete(id: number | string): Promise<Faq> {
    return await this.m.destroy({ where: { iFaqId: id } });
  }
}

export default FaqService;
