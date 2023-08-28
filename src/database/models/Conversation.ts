import { HasMany, Optional } from "sequelize";
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

interface ConversationAttributes {
  iConversationId: number;
  iSenderId: number;
  iChannelId: number;
  eType: string;
  vMessage: string;
  eStatus: string;
}

interface ConversationnCreationAttributes
  extends Optional<ConversationAttributes, "iConversationId"> {}

@Table({ timestamps: true, paranoid: false })
class Conversation extends Model<
  ConversationAttributes,
  ConversationnCreationAttributes
> {
  @Column({ primaryKey: true, autoIncrement: true })
  iConversationId!: number;

  @Column
  eType!: string;

  @Column
  vMessage!: string;

  @Column
  eStatus!: "Active" | "Inactive";

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

export default Conversation;
