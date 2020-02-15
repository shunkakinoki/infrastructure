const {
  resolve,
} = require("path");
const {
  existsSync,
  lstatSync,
  readdirSync,
} = require("fs");

function readStrategyFileList(year) {
  const fileList = [];
  const dirPath = resolve(`./src/strategy/${year}`);
  const isDir = existsSync(dirPath) && lstatSync(dirPath).isDirectory();
  if (!isDir) {
    return fileList;
  }

  const files = readdirSync(dirPath);
  files.forEach((item) => {
    const currentFile = item.slice(0, 2);
    fileList.push([
      `/strategy/${year}/${currentFile}`,
      `${year} Strategy Week ${currentFile}`,
    ]);
  });
  return fileList.reverse();
}

module.exports = readStrategyFileList;
