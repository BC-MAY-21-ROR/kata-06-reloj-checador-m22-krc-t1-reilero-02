let hour = document.getElementById("hour");
let minute = document.getElementById("minute");
let second = document.getElementById("second");

console.log("Hello from My JS");

function realTime() {
  var today = new Date();
  hour.innerHTML = today.getHours();
  minute.innerHTML = today.getMinutes();
  second.innerHTML = today.getSeconds();
}

setInterval(realTime, 1000);
