const faker = require("faker");

export default () => {
  let result = faker.image.image();
  console.log(result);
  return null;
};
