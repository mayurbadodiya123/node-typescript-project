import express, { Express, NextFunction, Request, Response } from "express";
import dotenv from "dotenv";
dotenv.config();
import cookieParser from "cookie-parser";
import helmet from "helmet";
import cors from "cors";
import httpStatus from "http-status";
import { errorHandler, errorConverter } from "./app/error/error-handler";
import { ApiError } from "./app/error/exception/default-error";
import compression from "compression";
import bodyParser from "body-parser";

import passport from "passport";
import { jwtStrategy } from "./app/config/passport.config";

class App {
  public app: Express;
  public port: number;
  constructor(controllers: any[], port: number) {
    this.app = express();
    this.port = port;
    this.initializeMiddleware();
    this.initializeControllers(controllers);
    this.initializeErrorMiddleware();
  }

  public initializeErrorMiddleware(): void {
    this.app.use((req: Request, res: Response, next: NextFunction) => {
      next(new ApiError(httpStatus.NOT_FOUND, "Not found"));
    });

    // convert error to ApiError, if needed
    this.app.use(errorConverter);

    //handle error
    this.app.use(errorHandler);
  }

  public initializeMiddleware(): void {
    this.app.use(bodyParser.urlencoded({ extended: false }));

    this.app.use(express.json({ limit: "50mb" }));
    this.app.use(express.urlencoded({ extended: true, limit: "50mb" }));
    this.app.use(cookieParser());

    this.app.use(helmet());

    this.app.use(cors());
    this.app.options("*", cors);

    this.app.use(compression());

    this.app.use(passport.initialize());
    passport.use("jwt", jwtStrategy);

    this.app.use(function (req: Request, res: Response, next: NextFunction) {
      res.header("Content-Type", "application/json");
      next();
    });
  }

  private initializeControllers(controllers: any[]) {
    controllers.forEach((controller) => {
      this.app.use("/api", controller.router);
    });
  }

  public listen() {
    return this.app.listen(this.port, () => {
      console.log(
        `⚡️[server]:: Server is running at http://localhost:${this.port}`
      );
    });
  }
}
export default App;
