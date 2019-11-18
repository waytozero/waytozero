import _ from "lodash";

const challengesClass = document.querySelector(".challenges")

if (challengesClass) {

  const removeChallenge = (remove) => {
    remove.closest(".notification").remove()
  };


  challengesClass.addEventListener('click', function(event) {
    if (event.target.classList.contains('mark-as-done-btn'))  {
      //event.target.href = "#"
      event.target.innerHTML = "<i class='fas fa-check-circle'></i> Marked as done";
      //event.target.setAttribute('disabled', 'true');
      event.target.classList.add("sent")
      // Wait 2 seconds & Remove smoothly parent class
      setTimeout(() => {
        removeChallenge(event.target)
      }, 2000);

    };
  });
};
