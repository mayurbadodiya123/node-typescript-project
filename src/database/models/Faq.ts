import { Optional } from "sequelize";
import { Table, Model, Column } from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";

interface FaqAttributes {
  iFaqId: number;
  vFaqTitle: string;
  tDescription: string;
}

interface FaqCreationAttributes extends Optional<FaqAttributes, "iFaqId"> {}

@Table({ timestamps: true, paranoid: false })
class Faq extends Model<FaqAttributes, FaqCreationAttributes> {
  @Column({ primaryKey: true, autoIncrement: true })
  iFaqId!: number;

  @Column
  vFaqTitle!: string;

  @Column
  tDescription!: string;

  @Column
  eStatus!: "Active" | "Inactive";
}

export default Faq;
