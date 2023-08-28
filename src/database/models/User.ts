import { Optional } from "sequelize";
import { Table, Model, Column, HasMany, HasOne } from "sequelize-typescript";
import Post from "./Post";

interface UserAttributes {
  iUserId: number;
  vFirstName: string;
  vLastName: string;
  vEamil: string;
  vPassword: string;
  vProfilePic: string;
  iPostCount: number;
}

interface UserCreationAttributes extends Optional<UserAttributes, "iUserId"> {}

@Table({ timestamps: true, paranoid: false })
class User extends Model<UserAttributes, UserCreationAttributes> {
  @Column({ primaryKey: true, autoIncrement: true })
  iUserId!: number;

  @Column
  vFirstName!: string;

  @Column
  vLastName!: string;

  @Column
  vEmail!: string;

  @Column
  vPassword!: string;

  @Column
  vProfilePic!: string;

  @HasMany(() => Post)
  posts!: Post[];

  // @HasOne(()=>Post)
  // post!:Post;
}

export default User;
