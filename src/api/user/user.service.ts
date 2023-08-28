import { Op } from "sequelize";
import BaseService from "../../app/base/base.service";
import { encryptPassword } from "../../app/utils/app.util";
import Post from "../../database/models/Post";
import User from "../../database/models/User";
import sequelize from "../../app/config/sequelize.config";
import Channels from "../../database/models/Channels";

class UserService extends BaseService<typeof User> {
  constructor() {
    super(User);
  }

  async update(id: number | string, data: User): Promise<User> {
    return await this.m.update(data, { where: { iUserId: id } });
  }

  async findById(id: number | string): Promise<User> {
    return await this.m.findOne({ where: { iUserId: id } });
  }
}

export default UserService;
