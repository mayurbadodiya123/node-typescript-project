import express from "express";
import { IController } from "../interface/base.interface";

export abstract class BaseController<Service> implements IController {
  public path: string;
  public router = express.Router();
  public service: Service;

  constructor(path: string, service: Service) {
    this.path = path;
    this.service = service;
  }

  public abstract intializeRoutes(): void;
}
