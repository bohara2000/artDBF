/*
 * Ogg.js Version 1.0.1
 *
 *  <video> element fallback support with help of plugins (totem, xiphQT, cortado)
 *
 * GPL 2007 <j@v2v.cc>
 * 
 * Usage:
 *  <script type="text/javascript" src="Ogg.js">
 *  </script>
 *  <script type="text/javascript">
 *    var cortado_location = 'http://example.com/cortado.jar';
 *  </script>
 *  <video src="http://example.com/sample.ogg" id="exampleVideo" 
 *                                 width="320" height="240" autoplay></video>
 *  
 * Parameters are:
 *  - src url/path to ogg file
 *  - width
 *  - height
 *  - autoplay(optional) [start movie right away, default true, values: true|false]
 *  - controls(optional) [show controls]
 *
 */

var cortado_location = 'cortado.jar';
var theora_help_url = 'http://firefogg.org/theoraPlayback.html';

function detectMimetype(mimetype) {
  for (var i = navigator.plugins.length; i-- > 0; ) {
    var plugin = navigator.plugins[i];
    if (typeof plugin[mimetype] != "undefined") {
      return true;
    }
  }
  return false;
};

function canPlayTheora() {
  var video = document.createElement('video');
  if(video.play) {
    if(navigator.userAgent.indexOf('AppleWebKit') > -1) {
      if(detectMimetype('video/ogg'))
        return true;
    } else {
      //right now this would be Firefog and Opera
      return true;
    }
  }
  return false;
}

function OggVideoElement(url, id, width, height, controls, autoplay) {
  var detectIE = function() {
    return !(navigator.plugins && navigator.plugins.length);
  };

  var playbackEngine = function() {
    if(detectIE()) {
      return 'cortado';
    }
    else if(canPlayTheora()) {
      return 'video';
    }
    else if(detectMimetype('application/x-java-applet') || navigator.javaEnabled()) {
      return 'cortado';
    }
    return 'none';
  }

  if(typeof(controls) == 'undefined') {
    controls = true;
  }
  if(typeof(autoplay) == 'undefined') {
    autoplay = true;
  }
  this.url = url;
  this.id = id;
  this.width = width;
  this.height = height;
  this.controls = controls;
  this.autoplay = autoplay;
  this.playback = playbackEngine();

  var el = false;
  if(this.playback == 'video') {
    el = document.createElement('video');
    el.src = this.url;
    el.id = this.id;
    el.width = this.width;
    el.height = this.height;
    el.controls = this.controls;
    el.autoplay = this.autoplay;
    if(this.autoplay) {
      setTimeout(function() { document.getElementById(el.id).play() }, 200);
    }
  }
  else if(this.playback == 'cortado') {
    if(this.controls)
      var status = 'status';
    else
      var status = 'hide';
    if(detectIE()) {
      el = document.createElement('div');
      el.innerHTML = '' +
      '<object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" ' +
      '  codebase="http://java.sun.com/update/1.5.0/jinstall-1_5_0-windows-i586.cab" ' +
      '  id="' + id + '" '+
      '  width="' + width + '" height="' + height + '">' +
      ' <param name="code" value="com.fluendo.player.Cortado">'+
      ' <param name="archive" value="' + cortado_location + '">'+
      ' <param name="url" value="' + url + '"> '+
      ' <param name="local" value="false"> '+
      ' <param name="keepAspect" value="false"> '+
      ' <param name="seekable" value="false">'+
      ' <param name="showStatus" value="' + status + '"> '+
      ' <param name="bufferSize" value="200"> '+
      ' <param name="autoPlay" value="' + this.autoplay + '"> '+
      ' <strong>Your browser does not have a Java Plug-in. <a href="http://java.com/download">Get the'+
      '  latest Java Plug-in here</a>.</strong>'+
      '</object>';
      el = el.firstChild;
    }
    else {
      el = document.createElement('object');
      el.setAttribute('classid', 'java:com.fluendo.player.Cortado.class');
      el.type = 'application/x-java-applet';
      el.setAttribute('archive', cortado_location);
      el.id = id;
      el.width = width;
      el.height = height;
      var params = {
        'code': 'com.fluendo.player.Cortado',
        'archive': cortado_location,
        'url': this.url,
        'local': 'false',
        'keepAspect': 'true',
        'video': 'true',
        'audio': 'true',
        'seekable': 'auto',
        'showStatus': status,
        'autoPlay': this.autoplay,
        'bufferSize': '200'
      }
      for(name in params){
        var p = document.createElement('param');
        p.name = name;
        p.value = params[name];
        el.appendChild(p);
      }
    }
  } else {
    el = document.createElement('div');
    el.style.width = this.width;
    el.style.height = this.height;
    el.style.background = '#ddd';
    el.innerHTML = '<div style="height:100%;padding:10%;padding-top:15%;text-align:center">Your browser does not have Ogg Theora Video playback support.<br><br><a href="'+theora_help_url+'">You can change that</a>.<br><br> You can also <a href="' + this.url + '">download the video</a> and use an external player.</div>';
  }
  //$('#' + this.id).replaceWith(el);
  var current = document.getElementById(this.id);
  current.parentNode.insertBefore(el, current.nextSibling);
  current.parentNode.removeChild(current);
}

(function(obj, evType, fn){ 
 if (obj.addEventListener){ 
   obj.addEventListener(evType, fn, false); 
   return true; 
 } else if (obj.attachEvent){ 
   var r = obj.attachEvent("on"+evType, fn); 
   return r; 
 } else { 
   return false; 
 } 
}(window, 'load', function() {
  if(!canPlayTheora()) {
    var VideoElements = document.getElementsByTagName("video");
    for(i = 0; i < VideoElements.length; i++) {
      var v = VideoElements[i];
      OggVideoElement(
          v.getAttribute('src'), v.getAttribute('id'),
          v.getAttribute('width'), v.getAttribute('height'),
          v.getAttribute('autoplay'), v.getAttribute('controls'));
        i--;
    }
  }
}));

