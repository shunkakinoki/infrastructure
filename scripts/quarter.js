const {resolve} = require("path");
const {existsSync, lstatSync, readdirSync} = require("fs");

function readQuarterFileList(year) {
  const fileList = [];
  const dirPath = resolve(`./src/quarter/${year}/`);
  const isDir = existsSync(dirPath) && lstatSync(dirPath).isDirectory();
  if (!isDir) {
    return fileList;
  }

  const files = readdirSync(dirPath);
  files.forEach(item => {
    const currentFile = item.slice(0, 2);
    fileList.push([
      `/quarter/${year}/${currentFile}`,
      `${year} Quarter ${currentFile}`,
    ]);
  });
  return fileList.reverse();
}

module.exports = readQuarterFileList;
