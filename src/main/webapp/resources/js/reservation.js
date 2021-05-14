/**
 * 
 */
const button = document.querySelector('.btn')
const form   = document.querySelector('.form')

button.addEventListener('click', function() {
   form.classList.add('form--no') 
});


/*
window.onload = function(){
	  document.querySelector('#date').value = new Date().toISOString().substring(0, 10);
}*/