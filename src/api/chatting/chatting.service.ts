import { Op } from "sequelize";
import { CreatedAt, Sequelize } from "sequelize-typescript";
import BaseService from "../../app/base/base.service";
import sequelize from "../../app/config/sequelize.config";
import ChannelMember from "../../database/models/ChannelMembers";
import Channel from "../../database/models/Channels";
import Conversation from "../../database/models/Conversation";
import User from "../../database/models/User";
class ChattingService extends BaseService<typeof Conversation> {
  constructor() {
    super(Conversation);
  }

  async findById(id: number | string): Promise<any> {
    return await Channel.findAll({
      where: { iChannelId: id },
      include: [
        {
          model: Conversation,
          required: true,
          include: [{ model: User, required: true }],
        },
        {
          model: ChannelMember,
          required: true,
          include: [{ model: User, required: true }],
        },
      ],
      order: [["createdAt", "desc"]],
    });
  }

  async channelList(id: number | string): Promise<any> {
    return await ChannelMember.findAll({
      where: {
        [Op.and]: [{ iUserId: id }],
      },

      include: [
        {
          model: Channel,
          required: true,
          include: [
            {
              model: Conversation,
              required: true,
              where: { iUserId: id },
              limit: 1,
              order: [["createdAt", "desc"]],
            },
            {
              model: ChannelMember,
              required: true,
              include: [{ model: User, required: true }],
            },
          ],
        },
      ],
      order: [["createdAt", "asc"]],
    });
  }
  async register(channels: any): Promise<any> {
    return await Channel.create(channels);
  }

  async addChannelMembers(member: any[]): Promise<any> {
    return await ChannelMember.bulkCreate(member);
  }

  async findAll(body: any): Promise<User[]> {
    let keyword = body.keyword;

    let externalWhereCond = {};
    keyword &&
      (externalWhereCond = {
        [Op.or]: [{ vFirstName: { [Op.substring]: `%${keyword}%` } }],
      });

    let sort: any[] = body.sort;

    return await User.findAll({
      limit: body.limit,
      offset: body.offset,
      // filters: body.filters,
      where: { ...externalWhereCond } || {},
      order: sort,
    });
  }

  async messageRegister(Conversation: any): Promise<any> {
    return await this.m.create(Conversation);
  }
}

export default ChattingService;
