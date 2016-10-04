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

    <script type="text/javascript">
    
    

    var prefs = new gadgets.Prefs();

    var lastType = "";
    var lastProof = "";
    


    function makeJSONRequest() {

        var params = {};
       
        params[gadgets.io.RequestParameters.CONTENT_TYPE] = gadgets.io.ContentType.JSON;

        var url = "https://qa.bridge.freeatm.com/Schedules/ad_network?device=EX023111-du"

        gadgets.io.makeRequest(url, response, params);

    }



    function response(obj) {

        var jsonObj = obj.data;

        var srcURL="";

        var html="";

        var srcType = "";

        var srcDuration = 0

        var srcProof = null;

        srcURL=jsonObj.creative_pointer;

        srcDuration=jsonObj.duration;

        srcType=jsonObj.proof_id;

        if(jsonObj.duration!="null") {
            alert("Duration"+jsonObj.duration);
            alert(parseInt(jsonObj.duration)*15)
            srcDuration=parseInt(jsonObj.duration)*15;}



        if(srcType=="") {
            //html += '<video autoplay> <source src="' + srcURL + '" type='+'"video/mp4'+'"> </video>';
        }
        else {
            html += '<img src="' + srcURL + '"/>';
        }
        document.getElementById('content_div').innerHTML = html;

        if(srcDuration!=0)
        {
            alert(srcDuraction);
            setTimeout(makeJSONRequest, srcDuration*1000);
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
