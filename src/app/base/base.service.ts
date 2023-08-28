class BaseService<Models> {
  public m: any;

  constructor(model: any) {
    this.m = model;
  }

  public async findOne(): Promise<Models> {
    return await this.m.findOne();
  }
}

export default BaseService
