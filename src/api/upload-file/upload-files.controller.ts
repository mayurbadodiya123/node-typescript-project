import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import upload from "../../app/middlewares/multer";
import UploadFilesService from "./upload-files.service";

class UploadFiles extends BaseController<UploadFilesService> {
  constructor() {
    super("/upload", new UploadFilesService());
    this.intializeRoutes();
  }

  public intializeRoutes() {
    this.router.post("", upload().array("files", 5), this.uploadFiles);

    this.router.use(this.path, this.router);
  }

  uploadFiles = async (req: Request, res: Response, next: NextFunction) => {
    try {
      console.log("the requested files", req);
      const reqFiles = await this.service.uploadFile(req.files);
      res.json({ data: reqFiles });
    } catch (error: any) {
      next(error);
    }
  };
}
export default UploadFiles;
