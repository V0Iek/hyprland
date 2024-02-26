import { MainBar, SecondBar } from "./bars/bars.js";
import { notificationPopup } from './notifications/notificationPopups.js';
import { PowerMenu } from "./powermenu/powermenu.js";

export default {
  style: "./style.css",
  windows: [MainBar(), SecondBar(), notificationPopup, PowerMenu()],
};
