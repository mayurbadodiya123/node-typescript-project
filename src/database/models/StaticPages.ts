import { Optional } from "sequelize";
import { Table, Model, Column } from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";

interface StaticPageAttributes {
  iStaticPagesId: number;
  vTitle: string;
  vCode: string;
  dTemplate: string;
}

interface StaticPageCreationAttributes
  extends Optional<StaticPageAttributes, "iStaticPagesId"> {}

@Table({ timestamps: true, paranoid: false })
class StaticPages extends Model<
  StaticPageAttributes,
  StaticPageCreationAttributes
> {
  @Column({ primaryKey: true, autoIncrement: true })
  iStaticPagesId!: number;

  @Column
  vTitle!: string;

  @Column
  vCode!: string;

  @Column
  tDescription!: string;
}

export default StaticPages;
