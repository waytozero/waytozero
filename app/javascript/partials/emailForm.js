var sf = {};

const mailForms = document.querySelectorAll('.mail-form');

const createSf = (i) => {
  sf.container = document.querySelector('.sfcontainer' + i);
  sf.form = document.querySelector('.sfform' + i);
  sf.trigger = document.querySelector('.sftrigger' + i);
  sf.input = document.querySelector('.sfinput' + i);
  sf.emailWarner = document.querySelector('.sfemailwarner' + i);
  sf.emailWarnersmall = document.querySelector('.sfemailwarnersmall' + i);
  sf.submitButton = document.querySelector('.sfsubmit' + i);
  sf.successMessage = document.querySelector('.sfsuccess' + i);
};

var screen = window.matchMedia('(max-width: 575.98px)');

sf.submitDelay = 1500;

sf.clickHandler = (e, i) => {
  createSf(i);
    switch (e.target) {
        case sf.trigger:
          if (screen.matches) {
          sf.container.style.width = '100%';
            } else {
          sf.container.style.width = '50vw';
          }
            e.target.classList.remove('shown');
            sf.input.classList.add('shown');
            sf.submitButton.classList.add('shown');
            sf.emailWarner.classList.remove('d-none');
            sf.input.focus();
            break;
        case sf.submitButton:
            sf.submitForm();
            break;
    }
}

sf.handleInputKeypress = (e) => {
    if (e.keyCode === 13) {
        e.preventDefault();
        sf.submitForm();
    }
}

sf.submitForm = () => {
    sf.input.style.transition = 'all .4s ease';
    sf.submitButton.style.transition = 'all .4s ease';
    sf.input.classList.remove('shown');
    sf.submitButton.classList.remove('shown');
    sf.container.style.transition = 'all .4s cubic-bezier(0.47, 0.47, 0.27, 1.20) .4s';
    sf.container.style.width = '';
    sf.successMessage.classList.add('shown');
    let submission = setTimeout(() => sf.form.submit(), sf.submitDelay);
}

mailForms.forEach(mailForm => {
  const i = Array.prototype.indexOf.call(mailForms, mailForm) + 1;
  mailForm.addEventListener('click', (e) => sf.clickHandler(e, i));
});

