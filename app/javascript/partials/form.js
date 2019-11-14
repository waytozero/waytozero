

const addClass = (choice) => {
  choice.classList.add("active");
  console.log('test');
};

const eventForm = () => {
const choices = document.querySelectorAll(".question-choice");
choices.forEach(choice => choice.addEventListener('click', (event) => {
  event.currentTarget.classList.toggle("active")
 }));
};

export {eventForm};
