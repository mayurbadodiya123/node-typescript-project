import multer from "multer";
import path from "path";
import { APP_CONFIG } from "../config/app.config";

const storage = () =>
  multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, "public/upload-files/");
    },
    filename: function (req, file, cb) {
      var datetimestamp = Date.now();
      cb(
        null,
        file.fieldname +
          "-" +
          datetimestamp +
          "." +
          file.originalname.split(".")[file.originalname.split(".").length - 1]
      );
    },
  });

const upload = () =>
  multer({
    storage: storage(),
    limits: { fileSize: 10000000 },
    fileFilter: function (req, file, callback) {
      var ext = path.extname(file.originalname);
      if (
        ext !== ".png" &&
        ext !== ".jpg" &&
        ext !== ".gif" &&
        ext !== ".jpeg"
      ) {
        return callback(new Error("Only images are allowed"));
      }
      callback(null, true);
    },
  });

export default upload;
