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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <div id="content_div"></div>

    <script type="text/javascript">
    
    alert("Test Gadget 2");

    var prefs = new gadgets.Prefs();

    var lastType = "";
    var lastProof = "";
    function init() {
      makeJsonRequest();
    }
    function makeJsonRequest()
    {
      var request = $.ajax({

              url: "https://qa.bridge.freeatm.com/Schedules/ad_network?device=EX023111-du",

              success: function(response) { 

                if(!response){ 

                  alert("Was null");

                } else {

                  alert(JSON.stringify(response));

                }


              },

              timeout: 5000

            }).fail( function( xhr, status ) {
                alert(xhr);
            });
            }





    function responseParse(obj) {
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
        //srcType=jsonObj.proof_id;

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
    gadgets.util.registerOnLoadHandler(init);
     </script>

  ]]>

  </Content>

</Module>
