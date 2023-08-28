import { Optional } from "sequelize";
import {
  Table,
  Model,
  Column,
  HasMany,
  HasOne,
  ForeignKey,
  BelongsTo,
} from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";
import Product from "./Product";
import ProductImage from "./ProductImage";

interface cartAttributes {
  iCartId: number;
  vProductImage: string;
  iProductId: number;
  iQuantity: number;
  vProductTitle: string;
  iUserId: number;
}

interface cartCreationAttributes extends Optional<cartAttributes, "iCartId"> {}

@Table({ timestamps: true, paranoid: false })
class Cart extends Model<cartAttributes, cartCreationAttributes> {
  @Column({ primaryKey: true, autoIncrement: true })
  iCartId!: number;

  @Column
  iQuantity!: number;

  @ForeignKey(() => Product)
  @Column
  iUserId!: number;

  @ForeignKey(() => Product)
  @Column
  iProductId!: number;

  @BelongsTo(() => Product, "iProductId")
  Product?: Product;

  // @BelongsTo(() => ProductImage, "vProductImage")
  // ProductImage?: ProductImage;
}

export default Cart;
