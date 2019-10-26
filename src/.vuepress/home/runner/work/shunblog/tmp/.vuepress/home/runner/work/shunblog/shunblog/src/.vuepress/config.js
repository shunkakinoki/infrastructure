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
        title: "2019 Quarter",
        collapsable: true,
        children: readQuarterFileList('2019')
      },
      {
        title: "2019 Month",
        collapsable: true,
        children: readMonthFileList('2019')
      },
      {
        title: "2019 Week",
        collapsable: true,
        children: readWeekFileList('2019'),
      },
      {
        title: "2019/10",
        collapsable: true,
        children: readDayFileList('2019', '10')
      },
    ],
  }
};
