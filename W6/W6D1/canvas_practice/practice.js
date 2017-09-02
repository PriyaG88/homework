document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("myCanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = "yellow";
  ctx.fillStyle = "yellow";
  ctx.fill();
  ctx.lineWidth = 15;
  ctx.stroke();

  ctx.beginPath();
  ctx.moveTo(75, 50);
  ctx.strokeStyle = "green";
  ctx.fillStyle = "green";
  ctx.lineTo(100, 75);
  ctx.lineTo(100, 25);
  ctx.fill();

});
