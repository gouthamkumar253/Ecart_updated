
$(document).on("change","#sort_brand",function(){
	var v=$("#sort_brand").val();
	//alert (v);
	 $.ajax({
    type:'GET',
    url: "instruments",
    data: { "brand" : v},
    //dataType: "json"
    
  });
});
