import { Optional } from "sequelize";
import {
  Table,
  Model,
  Column,
  ForeignKey,
  BelongsTo,
  HasOne,
  HasMany,
} from "sequelize-typescript";
import User from "./User";

interface SliderAttributes {
  iSliderId: number;
  vSliderUrl: string;
  iSliderSortId: number;
  vSliderRedirectTo: string;
}

interface SliderCreationAttributes
  extends Optional<SliderAttributes, "iSliderId"> {}

@Table({ timestamps: true, paranoid: false })
class Slider extends Model<SliderAttributes, SliderCreationAttributes> {
  @Column({ primaryKey: true, autoIncrement: true })
  iSliderId!: number;

  @Column
  vSliderUrl!: string;
  @Column
  iSliderSortId!: number;

  @Column
  vSliderRedirectTo!: string;

  @Column
  eStatus!: "Active" | "Inactive";
}

export default Slider;
