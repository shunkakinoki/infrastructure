const readDayFileList = require("../../scripts/day.js");
const readWeekFileList = require("../../scripts/week.js");
const readMonthFileList = require("../../scripts/month.js");
const readQuarterFileList = require("../../scripts/quarter.js");
const readYearFileList = require("../../scripts/year.js");
const readStrategyFileList = require("../../scripts/strategy.js");

module.exports = {
  title: "journal",
  description: "Life Mission",
  base: "/",
  theme: "yuu",
  head: [
    [
      "link",
      {
        rel: "icon",
        href: "/logo.png",
      },
    ],
  ],
  plugins: [
    [
      "@vuepress/google-analytics",
      {
        ga: "UA-134813374-14",
      },
      "vuepress-plugin-rss",
      {
        base_url: "/",
        site_url: "https://journal.shunkakinoki.com",
        count: 30,
      },
      "sitemap",
      {
        hostname: "https://journal.shunkakinoki.com",
      },
      "@vuepress/active-header-links",
      "@vuepress/back-to-top",
      "@vuepress/search",
      {
        searchMaxSuggestions: 30,
      },
      "@vuepress/nprogress",
    ],
  ],
  themeConfig: {
    lastUpdated: "Last Updated",
    nav: [
      {
        text: "Home",
        link: "/",
      },
      {
        text: "Life Mission",
        link: "/life-mission/",
      },
      {
        text: "Profile",
        link: "/profile/",
      },
      {
        text: "Timeline",
        link: "/timeline/",
      },
      {
        text: "Github",
        link: "https://github.com/shunkakinoki/journal",
      },
    ],
    sidebar: [
      ["/life-mission/", "Life Mission"],
      ["/profile/", "Profile"],
      ["/timeline/", "Timeline"],
      {
        title: "Strategy 2020",
        collapsable: true,
        children: readStrategyFileList("2020"),
      },
      {
        title: "Year",
        collapsable: true,
        children: readYearFileList(),
      },
      {
        title: "2020 Quarter",
        collapsable: true,
        children: readQuarterFileList("2020"),
      },
      {
        title: "2020 Month",
        collapsable: true,
        children: readMonthFileList("2020"),
      },
      {
        title: "2020 Week",
        collapsable: true,
        children: readWeekFileList("2020"),
      },
      {
        title: "2020/02",
        collapsable: true,
        children: readDayFileList("2020", "02"),
      },
    ],
    yuu: {
      defaultDarkTheme: true,
      defaultColorTheme: "blue",
    },
  },
};
