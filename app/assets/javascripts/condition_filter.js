
$(document).on("change","#sort_condition",function(){
	var v=$("#sort_condition").val();
	//alert (v);
	 $.ajax({
    type:'GET',
    url: "instruments",
    data: { "condition" : v},
    //dataType: "json"
    
  });
});
