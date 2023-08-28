import { Optional } from "sequelize";
import {
  Table,
  Model,
  Column,
  ForeignKey,
  BelongsTo,
} from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";
import Channels from "./Channels";
import User from "./User";

interface ChannelMembersAttributes {
  iChannelMemberId: number;
  iUserId: number;
  iChannelId: number;
  eStatus: string;
}

interface ChannelMembersCreationAttributes
  extends Optional<ChannelMembersAttributes, "iChannelMemberId"> {}

@Table({ timestamps: true, paranoid: false })
class ChannelMembers extends Model<
  ChannelMembersAttributes,
  ChannelMembersCreationAttributes
> {
  @Column({ primaryKey: true, autoIncrement: true })
  iChannelMemberId!: number;
  @ForeignKey(() => User)
  @Column
  iUserId!: number;

  @BelongsTo(() => User, "iUserId")
  users?: User;

  @ForeignKey(() => Channels)
  @Column
  iChannelId!: number;

  @BelongsTo(() => Channels, "iChannelId")
  channels?: Channels;
}

export default ChannelMembers;
