SerialPort = require("serialport").SerialPort
noflo = require 'noflo'

moveTo = (x, y) ->
  buf = new Buffer(7);
  buf.writeUInt8(0xFF, 0);
  buf.writeUInt8(0xFE, 1);
  buf.writeUInt16LE(y, 2); 
  buf.writeUInt16LE(x, 4);
  buf.writeUInt8(0xFD, 6);
  return buf;

class Plotter extends noflo.Component
  constructor: ->
    @device = null
    @serial = null
    @paths = null
    @inPorts =
      device: new noflo.Port 'string'
      paths: new noflo.Port 'object'
      run: new noflo.Port 'bang'
    @outPorts =
      completed: new noflo.Port 'boolean'

    @inPorts.device.on 'data', (data) =>
      @device = data
    @inPorts.paths.on 'data', (data) =>
      if data
        @paths = data
    @inPorts.run.on 'data', (data) =>
      @run()

  run: ->
    console.log @device, @paths
    if @device? and @paths?
      @serial = new SerialPort "/dev/ttyACM0", { baudrate: 9600 }
      @serial.on "open", (err) ->
        if (err)
          console.log err
        else
          console.log 'open'

#        console.log @serial
#        @serial.on 'data', (data) ->
#          console.log 'data received: ' + data

        workMin = 100;
        sendDelay = 800;
        positions = [
          [workMin, workMin, sendDelay]
        ]
        console.log @paths
        for path in @paths.points
          positions.push [path.x, path.y], sendDelay

        @nextPos positions, 0, ->
          @outPorts.completed.send true

  nextPos: (positions, index, cb) =>
    console.log positions, index, cb
    if index < positions.length
      p = positions[index]
      cmd = moveTo p[0], p[1]
      @serial.write cmd, (err, res) ->
        if err
          console.log "serialport write error: ", err
        else
          console.log "moved to X,Y (index, written)", p[0], p[1], index, res
          console.log "waiting for", p[2]/1000, "seconds"
          f = ->
            nextPos positions, index+1
          setTimeout f, p[2]
    else
      console.log "Sequence over"
      cb()


exports.getComponent = -> new Plotter

