import { Optional } from "sequelize";
import { Table, Model, Column, HasMany, HasOne } from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";
import Product from "./Product";

interface ProductCatagoryAttributes {
  iProductCatagoryId: number;
  vProductCatagoryName: string;
}

interface ProductCatagoryCreationAttributes
  extends Optional<ProductCatagoryAttributes, "iProductCatagoryId"> {}

@Table({ timestamps: true, paranoid: false })
class ProductCatagory extends Model<
  ProductCatagoryAttributes,
  ProductCatagoryCreationAttributes
> {
  @Column({ primaryKey: true, autoIncrement: true })
  iProductCatagoryId!: number;

  @Column
  vProductCatagoryName!: string;

  @HasMany(() => Product)
  Products!: Product[];
}

export default ProductCatagory;
