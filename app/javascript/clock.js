let counter = document.getElementById("counter");
let hour = document.getElementById("hour");
let minute = document.getElementById("minute");
let second = document.getElementById("second");

console.log("Hello from My JS");

function realTime() {
  var today = new Date();

  let hours = today.getHours();
  let minutes = today.getMinutes();
  let seconds = today.getSeconds();
  counter.innerHTML = `${hours}:${minutes}:${seconds}`;
}

setInterval(realTime, 1000);
