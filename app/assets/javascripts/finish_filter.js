
$(document).on("change","#sort_finish",function(){
	var v=$("#sort_finish").val();
	//alert (v);
	 $.ajax({
    type:'GET',
    url: "instruments",
    data: { "finish" : v},
    //dataType: "json"
    
  });
});
