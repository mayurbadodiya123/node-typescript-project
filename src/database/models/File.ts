import { Optional } from "sequelize";
import {
  Table,
  Model,
} from "sequelize-typescript";

interface FileAttributes {
  iPostId: number;
  iPostTitle: string;
  iUserId: number;
}

interface FileCreationAttributes extends Optional<FileAttributes, "iPostId"> {}

@Table({ timestamps: true, paranoid: false })
class File extends Model<FileAttributes, FileCreationAttributes> {}

// sequelize.addModels([Post]);

export default File;
