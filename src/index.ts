import App from "./app";
import AuthenctionController from "./api/authentication/authentication.controller";
import UserController from "./api/user/user.controller";
import PostController from "./api/post/post.controller";
import UploadFiles from "./api/upload-file/upload-files.controller";
import { APP_CONFIG } from "./app/config/app.config";
import FaqController from "./api/faq/faq.controller";
import ProductController from "./api/product/product.controller";
import ProductCatagoryController from "./api/product-catagory/product-catagory.controller";
import ReviewController from "./api/review/review.controller";
import CartController from "./api/cart/cart.controller";
import SliderController from "./api/slider/slider.controller";
import StaticPagesController from "./api/static-pages/static-pages.controller";
import ContactUsController from "./api/contact-us/contact-us.controller";
import ChattingController from "./api/chatting/chatting.controller";
const port = Number(APP_CONFIG.PORT) || 3000;

const declaration = [
  new AuthenctionController(),
  new UserController(),
  new PostController(),
  new UploadFiles(),
  new FaqController(),
  new ProductController(),
  new ProductCatagoryController(),
  new ReviewController(),
  new CartController(),
  new SliderController(),
  new StaticPagesController(),
  new ContactUsController(),
  new ChattingController(),
];

const app = new App([...declaration], port);

const server = app.listen();
const exitHandler = () => {
  if (server) {
    server.close(() => {
      process.exit(1);
    });
  } else {
    process.exit(1);
  }
};

const unexpectedErrorHandler = () => {
  exitHandler();
};

process.on("uncaughtException", unexpectedErrorHandler);
process.on("unhandledRejection", unexpectedErrorHandler);

process.on("SIGTERM", () => {
  if (server) {
    server.close();
  }
});
