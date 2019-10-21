const {
  resolve,
} = require("path");
const {
  existsSync,
  lstatSync,
  readdirSync,
} = require("fs");

function readMonthFileList(year) {
  const fileList = [];
  const dirPath = resolve(`./docs/month/${year}/`);
  const isDir = existsSync(dirPath) && lstatSync(dirPath).isDirectory();
  if (!isDir) {
    return fileList;
  }

  const files = readdirSync(dirPath);
  files.forEach((item) => {
    const currentFile = item.slice(0, 2);
    fileList.push([
      `/month/${year}/${currentFile}`,
      `${year}/${currentFile}`,
    ]);
  });
  return fileList.reverse();
}

module.exports = readMonthFileList;
