import BaseService from "../../app/base/base.service";
import StaticPages from "../../database/models/StaticPages";
class StaticPageService extends BaseService<typeof StaticPages> {
  constructor() {
    super(StaticPages);
  }

  async findById(id: number | string): Promise<any> {
    return await this.m.findOne({ where: { iStaticPagesId: id } });
  }

  async findByCode(code: string): Promise<any> {
    return await this.m.findOne({ where: { vCode: code } });
  }

  async findAll(body: any): Promise<StaticPages> {
    return await this.m.findAll();
  }

  async create(staticPages: StaticPages): Promise<StaticPages> {
    return await this.m.create(staticPages);
  }

  async update(id: number | string, data: StaticPages): Promise<StaticPages> {
    return await this.m.update(data, { where: { iStaticPagesId: id } });
  }

  async delete(id: number | string): Promise<StaticPages> {
    return await this.m.destroy({ where: { iStaticPagesId: id } });
  }
}

export default StaticPageService;
