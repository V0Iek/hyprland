import { MainBar, SecondBar } from "./bars/bars.js";
import { notificationPopup } from "./notifications/notificationPopups.js";
import media from "./media/media.js";
import { PowerMenu } from "./powermenu/powermenu.js";
import {
  LogoutPopup,
  RebootPopup,
  ShutdownPopup,
} from "./powermenu/widgets/power-popups.js";
import NotificationCalendar from "./notification-calendar/notification-calendar.js";

const scss = `${App.configDir}/style.scss`;
const css = `/tmp/my-style.css`;
Utils.exec(`sassc ${scss} ${css}`);

Utils.monitorFile(
  scss,

  function () {
    Utils.exec(`sassc ${scss} ${css}`);
    App.resetCss();
    App.applyCss(css);
  },
);

export default {
  style: css,
  windows: [
    MainBar(),
    SecondBar(),
    notificationPopup,
    media(),
    PowerMenu(),
    LogoutPopup(),
    RebootPopup(),
    ShutdownPopup(),
    NotificationCalendar(),
  ],
};
