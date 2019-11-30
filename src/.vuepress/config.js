const readDayFileList = require('../../scripts/day.js');
const readWeekFileList = require('../../scripts/week.js');
const readMonthFileList = require('../../scripts/month.js');
const readQuarterFileList = require('../../scripts/quarter.js');
const readYearFileList = require('../../scripts/year.js');

module.exports = {
  title: "shunblog",
  description: "Life Mission",
  base: '/',
  head: [
    ['link', {
      rel: 'icon',
      href: '/logo.png'
    }]
  ],
  themeConfig: {
    lastUpdated: 'Last Updated',
    nav: [{
        text: 'Home',
        link: '/'
      },
      {
        text: 'Life Mission',
        link: '/life-mission/'
      }, {
        text: 'Profile',
        link: '/profile/'
      }, {
        text: 'Timeline',
        link: '/timeline/'
      },
      {
        text: 'Github',
        link: 'https://github.com/shunkakinoki/shunblog'
      },
    ],
    sidebar: [
      ["/life-mission/", "Life Mission"],
      ["/profile/", "Profile"],
      ["/timeline/", "Timeline"],
      {
        title: "Year",
        collapsable: true,
        children: readYearFileList()
      },
      {
        title: "2020 Quarter",
        collapsable: true,
        children: readQuarterFileList('2020')
      },
      {
        title: "2020 Month",
        collapsable: true,
        children: readMonthFileList('2020')
      },
      {
        title: "2020 Week",
        collapsable: true,
        children: readWeekFileList('2020'),
      },
      {
        title: "2020/00",
        collapsable: true,
        children: readDayFileList('2020', '00')
      },
    ],
  }
};
