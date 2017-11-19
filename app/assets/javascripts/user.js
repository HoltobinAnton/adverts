$(document).on('turbolinks:load', function(){


    $('.get-address').focusout(function(){
        get_paramas()
    });



    if(!$("#state").text() || isNaN($("#state").text())){
      var country = $("#country").text()
      var city = $("#city").text()
      var state = $("#state").text()
      var address = $("#address").text()
      set_map(country, city, state, address)
    }

    function get_paramas(){
      var country = $("input[id='country']").val()
      var city = $("input[id='city']").val()
      var state = $("input[id='state']").val()
      var address = $("input[id='address']").val()
      var zip = $("input[id='zip']").val()
      set_map(country, city, state, address, zip);
    }


    function set_map(country="", city="", state="", address="", zip=""){
      var mapOptions = {
        center: new google.maps.LatLng(25.687944,-100.309403),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

      if(country == "Ukraine"){

        address = city + ',' + country + ',' + address + ',' + zip;
        
      }else{
        address = state + ',' + city+ ',' + country+ ',' + address+ ',' + zip;
      }

      var geocoder = new google.maps.Geocoder();

      geocoder.geocode({
        'address':address
      },

      function(result, status){
        if (status == google.maps.GeocoderStatus.OK){
          map.setCenter(result[0].geometry.location);

          var marker = new google.maps.Marker({
            map: map,
            position: result[0].geometry.location
          });
        }else{
        }
      });
      return false;
    }



});