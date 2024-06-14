

class KText{
  static const String loadingText = "正在加载...";
  static const String loginingText = "正在登录...";
  static const String registeringText = "正在注册...";

  static const String loginText = "登录";
  static const String registerText = "注册";

  static const List<Map<String,String>> menusTexts = [
    {
      "menuName":"新闻",
      "menuIcon":"assets/icon/icon_news.png",
      "menuTitle":"闻",
      "toPath":"/news_page"
    },
    {
      "menuName":"妹子",
      "menuIcon":"assets/icon/icon_girls.png",
      "menuTitle":"妹",
      "toPath":"/grils_page"
    },
    {
      "menuName":"视频",
      "menuIcon":"assets/icon/icon_video.png",
      "menuTitle":"视"
    },
    {
      "menuName":"搞笑",
      "menuIcon":"assets/icon/icon_smile.png",
      "menuTitle":"笑"
    },
    {
      "menuName":"每日一句",
      "menuIcon":"assets/icon/icon_every_day.jpg",
      "menuTitle":"每"
    },

  ];
}