
//= require jquery3
//= require popper
//= require bootstrap


function switchDisplay() {
    document.getElementById('flash-message').classList.add('none');
  }

if (document.getElementById('flash-message')) {
  setTimeout(() => {
    switchDisplay();
  }, 3000);
}