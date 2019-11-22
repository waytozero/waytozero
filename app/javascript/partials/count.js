import { CountUp } from 'countup.js';

const count = (selector) => {
  const counter = document.querySelector(selector);
if (counter) {
  const countUp = new CountUp(counter, Number(counter.innerText));
  countUp.start();
};
}

export {count};
