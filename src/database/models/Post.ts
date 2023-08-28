import { Optional } from "sequelize";
import { Table, Model, Column, ForeignKey, BelongsTo, HasOne, HasMany } from "sequelize-typescript";
import User from "./User";

interface PostAttributes {
  iPostId: number;
  iPostTitle: string;
  iUserId:number;
}

interface PostCreationAttributes extends Optional<PostAttributes, "iPostId"> {}

@Table({ timestamps: true, paranoid: false })
class Post extends Model<PostAttributes, PostCreationAttributes> {
  @Column({ primaryKey: true, autoIncrement: true })
  iPostId!: number;

  @Column
  vTitle!: string;

  @Column
  vType!: string;

  @Column
  vUrl!: string;

  @Column
  eStatus!: "Active" | "Inactive";

  @ForeignKey(() => User)
  @Column
  iUserId!: number;

  @BelongsTo(() => User, "iUserId")
  users?: User;
}

export default Post;
