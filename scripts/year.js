const {resolve} = require("path");
const {existsSync, lstatSync, readdirSync} = require("fs");

function readYearFileList() {
  const fileList = [];
  const dirPath = resolve("./src/year");
  const isDir = existsSync(dirPath) && lstatSync(dirPath).isDirectory();
  if (!isDir) {
    return fileList;
  }

  const files = readdirSync(dirPath);
  files.forEach(item => {
    const currentFile = item.slice(0, 4);
    fileList.push([`/year/${currentFile}`, `${currentFile}`]);
  });
  return fileList.reverse();
}

module.exports = readYearFileList;
