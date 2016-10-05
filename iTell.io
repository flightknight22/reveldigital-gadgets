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

  </style>



    <div id="content_div"></div>
   <script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    alert("Test Gadget");

    var prefs = new gadgets.Prefs();

    var lastType = "";
    var lastProof = "";
    


    function makeJSONRequest() {
        alert("Http Call");
        var params = {};
       
        params[gadgets.io.RequestParameters.CONTENT_TYPE] = gadgets.io.ContentType.JSON;
        
        var url = "https://qa.bridge.freeatm.com/Schedules/ad_network?device=EX023111-du";
        if(lastType!="" || lastProof!="")
        {
          url+="&"+lastProof+"&"+lastType;
        }
        gadgets.io.makeRequest(url, response, params);

    }



    function response(obj) {

        var jsonObj = obj.data;
        alert(JSON.stringify(jsonObj));
        var srcURL="";

        var html="";

        var srcType = "";

        var srcDuration = 0

        var srcProof = null;

        srcURL=jsonObj.creative_pointer;
        alert(srcURL);
        alert("New Gadget 3");
        srcDuration=jsonObj.duration;
        //alert(jsonObj.device)
        srcType=jsonObj.proof_id;

        if(jsonObj.duration!="null") {
            //alert("Duration"+jsonObj.duration);
            alert(parseInt(jsonObj.duration)*15)
            srcDuration=parseInt(jsonObj.duration)*15;}



        if(srcType==null) {
            alert("f");
            //html += '<video autoplay> <source src="' + https://s3.amazonaws.com/cms-transcoding-input/2015-9/38178d10-8c66-48c8-8a0d-5112aca828bf.mp4 + '" type='+'"video/mp4'+'"> </video>';
        }
        else {
            html = '<img src="' + srcURL + '"/>';
        }
        document.getElementById('content_div').innerHTML = html;
        alert("After Set HTML");
        if(srcDuration>0)
        {
            alert(srcDuration);
            setTimeout(makeJSONRequest, srcDuration*1000);
        }
        else
        {
          alert("Probs Video");
        }
        //document.getElementById('content_div').addEventListener('ended',myHandler,false);
        //function myHandler(e) {
        //    makeJSONRequest();
        //}

    }
    gadgets.util.registerOnLoadHandler(makeJSONRequest);

     </script>

  ]]>

  </Content>

</Module>
