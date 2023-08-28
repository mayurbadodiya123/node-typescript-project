import BaseService from "../../app/base/base.service";
import { encryptPassword } from "../../app/utils/app.util";
import User from "../../database/models/User";
import ForgetPassword from "../../database/models/ForgetPassword";

class AuthService extends BaseService<typeof User> {
  constructor() {
    super(User);
  }

  async register(user: any): Promise<User> {
    user.vPassword = await encryptPassword(user.vPassword);
    return await this.m.create(user);
  }

  async find(email: string): Promise<User> {
    console.log("emia", email);
    return await this.m.findOne({ where: { vEmail: email } });
  }

  async findForgetPassowrd(id: number | string): Promise<any> {
    return await ForgetPassword.findOne({ where: { iUserId: id } });
  }

  async updateToken(data: any): Promise<any> {
    return await ForgetPassword.update(data, {
      where: { iUserId: data.iUserId },
    });
  }
  async getUserById(id: string): Promise<User> {
    return await this.m.findOne({ where: { iUserId: id } });
  }

  async addToken(data: any): Promise<any> {
    return await ForgetPassword.create(data);
  }

  async resetPassword(data: any): Promise<any> {
    return await ForgetPassword.create(data);
  }

  async getIdByToken(data: any): Promise<any> {
    return await ForgetPassword.findOne({
      where: { vToken: data.vToken, vOTP: data.vOTP },
    });
  }

  async updateResetPassword(id: any, password: string): Promise<any> {
    const vPassword = await encryptPassword(password);
    const data = { vPassword };
    return await this.m.update(data, {
      where: { iUserId: id },
    });
  }

  async deleteForgetPassword(id: any): Promise<any> {
    return await ForgetPassword.destroy({
      where: { iUserId: id },
    });
  }
}

export default AuthService;
