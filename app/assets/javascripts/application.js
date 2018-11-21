// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

function handleFileSelect() {
  //Check File API support
  if (window.File && window.FileList && window.FileReader) {

      var files = event.target.files; //FileList object
      var output = document.getElementById("result");

      for (var i = 0; i < files.length; i++) {
          var file = files[i];
          //Only pics
          if (!file.type.match('image')) continue;

          var picReader = new FileReader();
          picReader.addEventListener("load", function (event) {
            var picFile = event.target;
            var li = document.createElement("li");
            li.className ='list'

            li.innerHTML = "<img class='thumbnail small_image' src='" + picFile.result + "'" + "title='" + picFile.name + "'/>";

            output.insertBefore(li, null);

          });
          //Read the image
          picReader.readAsDataURL(file);
      }
  } else {
      console.log("Your browser does not support File API");
  }
}

var element = document.getElementById('files')

if(element != null){
  document.getElementById('files').addEventListener('change', handleFileSelect, false);  
}
