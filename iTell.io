<?xml version="1.0" encoding="UTF-8" ?>

<Module>

  <ModulePrefs title="Revel iTell.io Gadget" description="Displays an add from iTell.io" author="RevelDigital" background="transparent"/>

  <UserPref name="deviceId" display_name="Device ID" default_value="" />

  <UserPref name="rdW" display_name="Width" required="true" default_value="280" datatype="hidden" />

  <UserPref name="rdH" display_name="Height" required="true" default_value="190" datatype="hidden" />

  <Content type="html">

  <![CDATA[

  

  

  <style type="text/css">

  body
  {

    background: transparent;

  }

  img

  {

    width: __UP_rdW__px;

    height: __UP_rdH__px;

  }
  video { margin: 0 auto; width: 400px; }
  </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <div id="content_div"></div>

    <script type="text/javascript">
    
      function initialize() {
        makeJsonRequest();
       }

		  function makeJsonRequest(proofID, proofType)
		  {
              var uri = "https://qa.bridge.freeatm.com/Schedules/ad_network?device=EX023111-du";
              if(proofID && proofType)
              {
                uri+="&type="+proofType+"&proof_id="+proofID;
              }
              var res = encodeURIComponent(uri);
              $.getJSON("https://as1.reveldigital.com/proxy?url=" + res, function (data) {
                if(data["creative_pointer"].endsWith(".mp4"))
                {
                    setVideo(data);
                }
                else
                {
                    setImage(data);
                }
              }, 1000);

		  }



    function setImage(obj) {
        alert("Image");
        var image = document.createElement('image');
        var srcDuration=parseInt(obj["duration"])*15*1000;
        html = '<img src="' + obj["creative_pointer"] + '"/>';
        document.getElementById('content_div').innerHTML = html;
        setTimeout(makeJsonRequest(obj["proof_id"], obj["type"]), srcDuration);
    }
    
    function setVideo(obj){
      alert("Video");
      var video = document.createElement('video');

      document.getElementById('content_div').innerHTML="";
      video.src = obj["creative_pointer"];
      document.getElementById('content_div').appendChild(video);

      if(video)
      {
        video.play();
        video.addEventListener('ended',function(){makeJsonRequest(obj["proof_id"], obj["type"])},false);
      }
    }
    
    function setInfo(data) {
      if (true) {
        var container = $('#info_container');
        container.append(data + '<br>');
      }	
      if (true) {
        console.log(data);
      }
      if (true) {
        alert(data);
      }
    }
    
    gadgets.util.registerOnLoadHandler(initialize);
     </script>

  ]]>

  </Content>

</Module>
