// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap

// turboが効かないのでコメントアウト
// import "@hotwired/turbo-rails"

function switchDisplay() {
    document.getElementById('flash-message').classList.add('none');
  }

if (document.getElementById('flash-message')) {
  setTimeout(() => {
    switchDisplay();
  }, 3000);
}

console.log('test');