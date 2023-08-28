import { Optional } from "sequelize";
import { Table, Model, Column } from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";

interface ContactUsAttributes {
  iContactUsId: number;
  vContactUsTitle: string;
  tDescription: string;
}

interface ContactUsCreationAttributes
  extends Optional<ContactUsAttributes, "iContactUsId"> {}

@Table({ timestamps: true, paranoid: false })
class ContactUs extends Model<
  ContactUsAttributes,
  ContactUsCreationAttributes
> {
  @Column({ primaryKey: true, autoIncrement: true })
  iContactUsId!: number;

  @Column
  vName!: string;

  @Column
  vEmail!: string;

  @Column
  vNumber!: string;

  @Column
  vDescription!: string;

  @Column
  tReply!: string;

  @Column
  eStatus!: "Active" | "Inactive";
}

export default ContactUs;
