import { Sequelize } from "sequelize-typescript";
import Post from "../../database/models/Post";
import User from "../../database/models/User";
import Product from "../../database/models/Product";
import ProductCatagory from "../../database/models/ProductCatagory";
import { APP_CONFIG } from "../config/app.config";
import ProductImage from "../../database/models/ProductImage";
import Cart from "../../database/models/Cart";
import Slider from "../../database/models/Slider";
import Channel from "../../database/models/Channels";
import ChannelMember from "../../database/models/ChannelMembers";
import Conversation from "../../database/models/Conversation";
import Channels from "../../database/models/Channels";
import ChannelMembers from "../../database/models/ChannelMembers";
import ContactUs from "../../database/models/ContactUs";
import StaticPages from "../../database/models/StaticPages";
import Review from "../../database/models/Review";
import ForgetPassword from "../../database/models/ForgetPassword";
import Faq from "../../database/models/Faq";

const sequelize = new Sequelize({
  host: APP_CONFIG.DATABASE.HOST,
  database: APP_CONFIG.DATABASE.NAME,
  dialect: "mysql",
  username: APP_CONFIG.DATABASE.USER,
  password: APP_CONFIG.DATABASE.PASSWORD,
});

sequelize.addModels([
  User,
  Post,
  Product,
  ProductCatagory,
  ProductImage,
  Cart,
  Slider,
  Channel,
  Conversation,
  ChannelMember,
  ContactUs,
  StaticPages,
  Review,
  ForgetPassword,
  Faq,
]);

export default sequelize;
