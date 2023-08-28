import { Optional } from "sequelize";
import { Table, Model, Column } from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";

interface ReviewAttributes {
  iReviewId: number;
  iProductId: number;
  vUserName: string;
  vDate: string;
  vReviews: string;
  iStar: number;
  vLikes: string;
  vDislikes: string;
}

interface ReviewCreationAttributes
  extends Optional<ReviewAttributes, "iReviewId"> {}

@Table({ timestamps: true, paranoid: false })
class Review extends Model<ReviewAttributes, ReviewCreationAttributes> {
  @Column({ primaryKey: true, autoIncrement: true })
  iReviewId!: number;

  @Column
  iProductId!: number;

  @Column
  vUserName!: string;

  @Column
  vDate!: string;

  @Column
  vReviews!: string;

  @Column
  iStar!: number;

  @Column
  vLikes!: string;

  @Column
  vDislikes!: string;
}

export default Review;
