// Code partially taken from Simple Recorder.js @octavn

//webkitURL is deprecated but nevertheless

URL = window.URL || window.webkitURL;

var gumStream;                      //stream from getUserMedia()
var rec;                            //Recorder.js object
var input;                          //MediaStreamAudioSourceNode we'll be recording

// shim for AudioContext when it's not avb.
var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext //audio context to help us record

var recordButton = document.getElementById("recordButton");
var stopButton = document.getElementById("stopButton");


const canvas = document.querySelector('.visualizer');
let audioCtx;
const canvasCtx = canvas.getContext("2d");

//add events to those 2 buttons
recordButton.addEventListener("click", startRecording);
stopButton.addEventListener("click", stopRecording);


function startRecording() {
    console.log("recordButton clicked");

    /*
        Simple constraints object, for more advanced audio features see
        https://addpipe.com/blog/audio-constraints-getusermedia/
    */

    var constraints = { audio: true, video:false }

    /*
        Disable the record button until we get a success or fail from getUserMedia()
    */

    recordButton.disabled = true;
    stopButton.disabled = false;


    /*
        We're using the standard promise based getUserMedia()
        https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia
    */

    navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
        console.log("getUserMedia() success, stream created, initializing Recorder.js ...");

        /*
            create an audio context after getUserMedia is called
            sampleRate might change after getUserMedia is called, like it does on macOS when recording through AirPods
            the sampleRate defaults to the one set in your OS for your playback device

        */
        audioContext = new AudioContext();


        visualize(stream);

        //update the format
        document.getElementById("formats").innerHTML="Format: 1 channel pcm @ "+audioContext.sampleRate/1000+"kHz"

        /*  assign to gumStream for later use  */
        gumStream = stream;

        /* use the stream */
        input = audioContext.createMediaStreamSource(stream);

        /*
            Create the Recorder object and configure to record mono sound (1 channel)
            Recording 2 channels  will double the file size
        */
        rec = new Recorder(input,{numChannels:1})

        //start the recording process
        rec.record()

        console.log("Recording started");

    }).catch(function(err) {
        //enable the record button if getUserMedia() fails
        recordButton.disabled = false;
        stopButton.disabled = true;

    });
}


function stopRecording() {
    console.log("stopButton clicked");

    //disable the stop button, enable the record too allow for new recordings
    stopButton.disabled = true;
    recordButton.disabled = false;

    //tell the recorder to stop the recording
    rec.stop();

    //stop microphone access
    gumStream.getAudioTracks()[0].stop();

    //create the wav blob and pass it on to createDownloadLink
    rec.exportWAV(createDownloadLink);
}

function createDownloadLink(blob) {
    var url = URL.createObjectURL(blob);


    console.log(blob.size) // Here is the size of the blob in bytes


    var au = document.createElement('audio');
    var li = document.createElement('li');
    var link = document.createElement('a');

    //name of .wav file to use during upload and download (without extendion)
    var filename = new Date().toISOString();

    //add controls to the <audio> element
    au.controls = true;
    au.src = url;

    //save to disk link
    link.href = url;
    link.download = filename+".wav"; //download forces the browser to donwload the file using the filename
    // link.innerHTML = "Save to disk";

    //add the new audio element to li
    li.appendChild(au);

    //upload link
    var upload = document.createElement('a');
    const deleteButton = document.createElement('button');

    upload.href="#";
    upload.innerHTML = "Sumbit";
    // beautify the Submit button
    upload.setAttribute("class", "btn-md btn btn-outline-success")


    deleteButton.textContent = 'Delete';
    deleteButton.setAttribute("class", "btn-sm btn btn-outline-danger")


    // define deleting
    deleteButton.onclick = function(e) {
        let evtTgt = e.target;
        evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);
    }


    // Submit button clicked
    upload.addEventListener("click", function(event){

        // popup check
        if( ! confirm("Are you sure?") ){
            e.preventDefault();
        } else {
            // Change what is displayed
            var recordingsText = document.getElementById("recordingsText");
            recordingsText.style.display = "none";
            var textOnSubmit = document.getElementById("textOnSubmit");
            textOnSubmit.style.display = "block";

            var xhr=new XMLHttpRequest();
            xhr.onload=function(e) {
                if(this.readyState === 4) {
                    console.log("Server returned: ",e.target.responseText);
                    // check server response here 202 vs 406
                    if( e.target.responseText == "202" ){
                        var textOnSubmit = document.getElementById("textOnSubmit");
                        textOnSubmit.style.display = "none";
                        var textOnComplete = document.getElementById("textOnComplete");
                        textOnComplete.style.display = "block";
                    }
                    else {
                        var textOnSubmit = document.getElementById("textOnSubmit");
                        textOnSubmit.style.display = "none";
                        var textOnFail = document.getElementById("textOnFail");
                        textOnFail.style.display = "block";
                    }
                }
            };
            var fd=new FormData();
            fd.append("audio_data",blob, filename);
            xhr.open("POST","/response2",true);
            xhr.send(fd);
        }

    })


    li.appendChild(document.createTextNode (" "))//add a space in between
    li.appendChild(deleteButton)
    li.appendChild(document.createTextNode (" "))//add a space in between
    li.appendChild(upload)//add the upload link to li

    //add the li element to the ol
    recordingsList.appendChild(li);
}




// Visualizing the user recording in real time

function visualize(stream) {
    if(!audioCtx) {
      audioCtx = new AudioContext();
    }

    const source = audioCtx.createMediaStreamSource(stream);

    const analyser = audioCtx.createAnalyser();
    analyser.fftSize = 2048;
    const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

    source.connect(analyser);
    //analyser.connect(audioCtx.destination);

    draw()

    function draw() {
      const WIDTH = canvas.width
      const HEIGHT = canvas.height;

      requestAnimationFrame(draw);

      analyser.getByteTimeDomainData(dataArray);

      canvasCtx.fillStyle = 'rgb(250, 250, 250)';
      canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);



      canvasCtx.lineWidth = 2;
      canvasCtx.strokeStyle = 'rgb(0, 0, 0)';


      canvasCtx.beginPath();

      let sliceWidth = WIDTH * 1.0 / bufferLength;
      let x = 0;


      for(let i = 0; i < bufferLength; i++) {

        let v = dataArray[i] / 128.0;
        let y = v * HEIGHT/2;

        if(i === 0) {
          canvasCtx.moveTo(x, y);
        } else {
          canvasCtx.lineTo(x, y);
        }

        x += sliceWidth;
      }

      canvasCtx.lineTo(canvas.width, canvas.height/2);
      canvasCtx.stroke();

    }
  }
