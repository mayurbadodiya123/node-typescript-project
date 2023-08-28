import BaseService from "../../app/base/base.service";
import sequelize from "../../app/config/sequelize.config";
import Post from "../../database/models/Post";
import User from "../../database/models/User";

class PostService extends BaseService<typeof Post> {
  constructor() {
    super(Post);
  }

  async findById(id: number | string): Promise<any> {
    return await this.m.findOne({ where: { iPostId: id } });
  }

  async findAll(body: any): Promise<Post> {
    return await this.m.findAll();
  }

  // async create(post: Post): Promise<Post> {
  //   return await this.m.create(post);
  // }

  async create(post: Post): Promise<any> {
    const t = await sequelize.transaction();
    try {
      const postRes = await this.m.create(post, { transaction: t });

      // const user = await User.update(
      //   { iPostCount: 6 },
      //   {
      //     where: {
      //       iUserId: 8,
      //     },
      //     transaction: t,
      //   }
      // );
      // t.commit();
      return postRes;
    } catch (error: any) {
      t.rollback();
      return error.message;
    }
  }

  async update(id: number | string, data: Post): Promise<Post> {
    return await this.m.update(data, { where: { iPostId: id } });
  }

  async delete(id: number | string): Promise<Post> {
    return await this.m.destroy({ where: { iPostId: id } });
  }

  async checkEmail(vEmail: String): Promise<Post> {
    return await this.m.findOne({ where: { vEmail: vEmail } });
  }
}

export default PostService;
