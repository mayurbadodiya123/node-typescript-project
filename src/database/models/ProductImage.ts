import { Optional } from "sequelize";
import {
  Table,
  Model,
  Column,
  HasMany,
  HasOne,
  ForeignKey,
} from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";
import Product from "./Product";

interface ProductImageAttributes {
  iProductImageId: number;
  vProductImage: string;
  iProductId: number;
}

interface ProductImageCreationAttributes
  extends Optional<ProductImageAttributes, "iProductImageId"> {}

@Table({ timestamps: true, paranoid: false })
class ProductImage extends Model<
  ProductImageAttributes,
  ProductImageCreationAttributes
> {
  @Column({ primaryKey: true, autoIncrement: true })
  iProductImageId!: number;

  @Column
  vProductImage!: string;

  @ForeignKey(() => Product)
  @Column
  iProductId!: number;
}

export default ProductImage;
