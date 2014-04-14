var SerialPort = require("serialport").SerialPort

function moveTo(x, y) {
  var buf = new Buffer(7);
  buf.writeUInt8(0xFF, 0);
  buf.writeUInt8(0xFE, 1);
  buf.writeUInt16LE(y, 2); // Y
  buf.writeUInt16LE(x, 4); // X
  buf.writeUInt8(0xFD, 6);
  return buf;
}

var serialPort = new SerialPort("/dev/ttyACM0", {
  baudrate: 9600
});

serialPort.on("open", function () {
  console.log('open');
  serialPort.on('data', function(data) {
    console.log('data received: ' + data);
  });

  var workMin = 100;
  var workMax = 2500;
  var sendDelay = 800;
  var positions = [
    [workMin, workMin, sendDelay],
    [workMin, workMax, sendDelay],
    [workMax, workMax, sendDelay],
    [workMax, workMin, sendDelay],
    [workMin, workMin, sendDelay]
  ]
  positions = [
    [100, 100, sendDelay],
    [500, 500, sendDelay],
    [700, 500, sendDelay],
    [700, 700, sendDelay],
    [500, 700, sendDelay],
    [500, 500, sendDelay],
    [100, 100, sendDelay],
  ]
//  positions = [ positions[0] ]

  var nextPos = function(index) {
        if (index < positions.length) {
          var p = positions[index];
          var cmd = moveTo(p[0], p[1]);
          serialPort.write(cmd, function (err, res) {
              if (err) {
                console.log("serialport write error: ", err);
              } else {
                console.log("moved to X,Y (index, written)", p[0], p[1], index, res);
                console.log("waiting for", p[2]/1000, "seconds");
                setTimeout(function () { nextPos(index+1) }, p[2]);
              }
          });
        } else {
            console.log("Sequence over");
            setTimeout(function () { nextPos(0); }, 2000);
        }
  }
  setTimeout(function () { nextPos(0); }, 3000);
  

});
