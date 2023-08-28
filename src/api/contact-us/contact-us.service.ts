import BaseService from "../../app/base/base.service";
import ContactUsPage from "../../database/models/ContactUs";
class ContactUsService extends BaseService<typeof ContactUsPage> {
  constructor() {
    super(ContactUsPage);
  }

  async findById(id: number | string): Promise<any> {
    return await this.m.findOne({ where: { iStaticPagesId: id } });
  }

  async findByCode(code: string): Promise<any> {
    return await this.m.findOne({ where: { vCode: code } });
  }

  async findAll(body: any): Promise<ContactUsPage> {
    return await this.m.findAll();
  }

  async create(contactUs: ContactUsPage): Promise<ContactUsPage> {
    return await this.m.create(contactUs);
  }

  async update(
    id: number | string,
    data: ContactUsPage
  ): Promise<ContactUsPage> {
    return await this.m.update(data, { where: { iContactUsId: id } });
  }

  async delete(id: number | string): Promise<ContactUsPage> {
    return await this.m.destroy({ where: { iContactUsId: id } });
  }
}

export default ContactUsService;
