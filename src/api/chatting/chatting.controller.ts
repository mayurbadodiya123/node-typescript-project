import { Request, Response, NextFunction } from "express";
import { BaseController } from "../../app/base/base.controller";
import { message } from "../../app/response/response.message";
import ResponseStatus from "../../app/response/response";
import { Chatting } from "./chatting.types";
import ChattingService from "./chatting.service";
import { NotFoundException } from "../../app/error/exception/not-found-error";
import { authenticateJwt } from "../../app/middlewares/jwt-token";
import { createFaqSchema, updateFaqSchema } from "./chatting.validator";
import { decodeJwtToken, getTimeDifference } from "../../app/utils/app.util";

type ChatType = {
  iUserId: number;
  vName: string;
  vDisplayPic: string;
  vDescription: string;
};
type MessageType = {
  iUserId?: number;
  vMessage: string;
  eType: string;
  iChannelId: string;
};

class ChattingController extends BaseController<ChattingService> {
  constructor() {
    super("/chatting", new ChattingService());
    this.intializeRoutes();
  }

  public intializeRoutes(): void {
    this.router.get("/load-conversation/:id", this.get);
    this.router.get("/channel-list", this.list);
    this.router.post("/new-conversation", this.register);
    this.router.post("/searching", this.user_list);
    this.router.post("/send-message", this.send_message);

    this.router.use(this.path, this.router);
    // this.router.post("/list", authenticateJwt, this.list);
    // this.router.post(
    //   "/create",
    //   [authenticateJwt, createFaqSchema],
    //   this.create
    // );
    // this.router.put("/:id", [authenticateJwt, updateFaqSchema], this.update);
    // this.router.delete("/:id", authenticateJwt, this.delete);
    // this.router.use(this.path, this.router);
  }

  get = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const userDetails = decodeJwtToken(req.header("authorization")!);
      const conversion = await this.service
        .findById(req.params.id)
        .then()
        .catch();
      if (!conversion) throw new NotFoundException("conversion not found");

      res.json(ResponseStatus.success(message.conversion.get, conversion));
    } catch (error: any) {
      next(error);
    }
  };

  list = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const userDetails = decodeJwtToken(req.header("authorization")!);
      const conversion = await this.service
        .channelList(userDetails.iUserId)
        .then()
        .catch();
      if (!conversion) throw new NotFoundException("User list not found");

      res.json(ResponseStatus.success(message.conversion.get, conversion));
    } catch (error: any) {
      next(error);
    }
  };

  register = async (req: Request, res: Response, next: NextFunction) => {
    try {
      req.body as ChatType;
      console.log("request body -------------", req.body);

      const channel = await this.service
        .register({
          iUserId: req.body.iUserId,
          vName: req.body.vFirstName,
          vDisplayPic: req.body.vProfilePic,
          vDescription: req.body.vEmail,
        })
        .then()
        .catch();

      const userDetails = decodeJwtToken(req.header("authorization")!);

      const channelMember = await this.service.addChannelMembers([
        {
          iUserId: userDetails.iUserId,
          iChannelId: channel.iChannelId,
        },
        {
          iUserId: req.body.iUserId,
          iChannelId: channel.iChannelId,
        },
      ]);

      res.json(
        ResponseStatus.success(message.chatting.allChannel, {
          channel,
          channelMember,
        })
      );
    } catch (error: any) {
      next(error);
    }
  };

  user_list = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const channelMember = await this.service.findAll(req.body).then().catch();
      res.json(
        ResponseStatus.success(message.chatting.newMember, channelMember)
      );
    } catch (error: any) {
      next(error);
    }
  };

  send_message = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const userDetails = decodeJwtToken(req.header("authorization")!);

      console.log("user detauk", userDetails.iUserId);
      const { vMessage, eType, iChannelId } = req.body as MessageType;
      // const { iUserId } =, req.body as any;

      const channelmessage = await this.service
        .messageRegister({
          iUserId: userDetails.iUserId,
          vMessage,
          eType,
          iChannelId,
        })
        .then()
        .catch();
      res.json(
        ResponseStatus.success(message.chatting.message, channelmessage)
      );
    } catch (error: any) {
      next(error);
    }
  };
}

export default ChattingController;
