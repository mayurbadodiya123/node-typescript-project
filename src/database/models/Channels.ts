import { Optional } from "sequelize";
import {
  Table,
  Model,
  Column,
  HasMany,
  ForeignKey,
} from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";
import ChannelMember from "./ChannelMembers";
import Conversation from "./Conversation";

interface ChannelsAttributes {
  iChannelId: number;
  vName: string;
  vDisplayPic: string;
  vDescription: string;
  eStatus: string;
}

interface ChannelsCreationAttributes
  extends Optional<ChannelsAttributes, "iChannelId"> {}

@Table({ timestamps: true, paranoid: false })
class Channels extends Model<ChannelsAttributes, ChannelsCreationAttributes> {
  @Column({ primaryKey: true, autoIncrement: true })
  iChannelId!: number;

  @Column
  vName!: string;

  @Column
  vDisplayPic!: string;

  @Column
  vDescription!: string;

  @Column
  eStatus!: "Active" | "Inactive";

  @HasMany(() => Conversation)
  conversations!: Conversation[];

  @HasMany(() => ChannelMember)
  channelMember!: ChannelMember[];
}

export default Channels;
