import readMonthFileList from "../scripts/month";

test("This directory doesn't exists.", () => {
  expect(readMonthFileList("2019", "13")).toEqual([]);
});

test("Directory exists, files are not empty.", () => {
  expect(readMonthFileList("2019", "01").length).not.toBe(0);
});
