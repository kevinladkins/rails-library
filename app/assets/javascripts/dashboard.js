
$(function() {
  getStats();

})

function getStats() {
  $.get('dashboard/stats', stats => {
    collectionStats(stats.collection);
    userStats(stats.users)
  })
}

function collectionStats(stats) {
  var loanStatsCanvas = document.getElementById('loan-stats');
  loanStatsCanvas.height = 300;
  loanStatsCanvas.width = 300;
  var loanStats = new Piechart({
    canvas: loanStatsCanvas,
    data: stats,
    colors: ["#5bc0de", "#d9534f"]
  });
  $('#book-total').html(stats["All Books"]);
  $('#loan-total').html(stats["On Loan"]);
  loanStats.draw();
}

function userStats(stats) {
  var loanStatsCanvas = document.getElementById('user-stats');
  loanStatsCanvas.height = 300;
  loanStatsCanvas.width = 300;
  var loanStats = new Piechart({
    canvas: loanStatsCanvas,
    data: stats,
    colors: ["#5bc0de", "#d9534f"]
  });
  $('#user-total').html(stats["All Users"]);
  $('#active-total').html(stats["Active Users"]);
  loanStats.draw();
}


var loans = {
  "overdue": 10,
  "outstanding": 15
}


function drawLine(ctx, startX, startY, endX, endY) {
  ctx.beginPath();
  ctx.moveTo(startX, startY);
  ctx.lineTo(endX, endY);
  ctx.stroke();
}

function drawArc(ctx, centerX, centerY, radius, startAngle, endAngle) {
  ctx.beginPath();
  ctx.arc(centerX, centerY, radius, startAngle, endAngle);
  ctx.stroke();
}

function drawPieSlice(ctx, centerX, centerY, radius, startAngle, endAngle, color) {
  ctx.fillStyle = color;
  ctx.beginPath();
  ctx.moveTo(centerX, centerY);
  ctx.arc(centerX, centerY, radius, startAngle, endAngle);
  ctx.closePath();
  ctx.fill();
}

var Piechart = function(options) {
  this.options = options;
  this.canvas = options.canvas;
  this.ctx = this.canvas.getContext('2d');
  this.colors = options.colors;

  this.draw = function() {
    var total_value = 0;
    var color_index = 0;
    for (var categ in this.options.data) {
      var val = this.options.data[categ];
      total_value +=val;
    }

    var start_angle = 0;
    for (categ in this.options.data) {
      val = this.options.data[categ];
      var slice_angle = 2 * Math.PI * val/total_value;

        drawPieSlice(
          this.ctx,
          this.canvas.width/2,
          this.canvas.height/2,
          Math.min(this.canvas.width/2, this.canvas.height/2),
          start_angle,
          start_angle+slice_angle,
          this.colors[color_index%this.colors.length]
        );

      start_angle += slice_angle;
      color_index++;
    }
  }
}
