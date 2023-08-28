import { Optional } from "sequelize";
import { Table, Model, Column, HasMany, HasOne } from "sequelize-typescript";
import sequelize from "../../app/config/sequelize.config";

interface ForgetPasswordAttributes {
  iForgetPasswordId: number;
  iUserId: number;
  vToken: string;
  vOTP: string;
}

interface ForgetPasswordCreationAttributes
  extends Optional<ForgetPasswordAttributes, "iForgetPasswordId"> {}

@Table({ timestamps: true, paranoid: false })
class ForgetPassword extends Model<
  ForgetPasswordAttributes,
  ForgetPasswordCreationAttributes
> {
  @Column({ primaryKey: true, autoIncrement: true })
  iForgetPasswordId!: number;

  @Column
  iUserId!: number;

  @Column
  vToken!: string;

  @Column
  vOTP!: string;
}

export default ForgetPassword;
