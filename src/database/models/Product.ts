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
import ProductCatagory from "./ProductCatagory";
import ProductImage from "./ProductImage";

interface ProductAttributes {
  iProductId: number;
  vProductTitle: string;
  iProductPrice: number;
  vProductCategory: string;
  vProductDescription: string;
  vProductInformation: string;
  vAdditionalInfo: Date;
  vShipping: string;
}

interface ProductCreationAttributes
  extends Optional<ProductAttributes, "iProductId"> {}

@Table({ timestamps: true, paranoid: false })
class Product extends Model<ProductAttributes, ProductCreationAttributes> {
  @Column({ primaryKey: true, autoIncrement: true })
  iProductId!: number;

  @Column
  vProductTitle!: string;

  @Column
  iProductPrice!: number;

  @Column
  vProductDescription!: string;

  @Column
  vProductInformation!: string;

  @Column
  vAdditionalInfo!: string;

  @Column
  vShipping!: string;

  @HasMany(() => ProductImage)
  images!: ProductImage[];

  @BelongsTo(() => ProductCatagory, "iProductCategory")
  categories?: ProductCatagory;

  @ForeignKey(() => ProductCatagory)
  @Column
  iProductCategory!: number;

  //   @Column
  //   iPostCount!: number

  //   @HasMany(() => Post)
  //   posts!: Post[]

  // @HasOne(()=>Post)
  // post!:Post;
}

export default Product;
