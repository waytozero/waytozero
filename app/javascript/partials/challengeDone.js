import _ from "lodash";

const removeChallenge = (remove) => {
  remove.closest(".notification").remove()
};

const handleClick = (event) => {
  if (event.target.classList.contains('mark-as-done-btn'))  {
    event.target.innerHTML = "<i class='fas fa-check-circle'></i> Marked as done";
    console.log(event.target.innerHTML)
    event.target.classList.add("sent")
    // Wait 2 seconds & Remove smoothly parent class
    setTimeout(() => {
      removeChallenge(event.target)
    }, 800);
  };
}

const handleMarkAsDone = () => {
  const challengesClass = document.querySelector(".challenges")
  if (!challengesClass) return;
  challengesClass.addEventListener('click', handleClick);
}

handleMarkAsDone();
