$(document).ready(function(){
	$(document).on("click", ".check_box", function(){
		var questionTypeVal = $("#question_question_type").val();
		 if (questionTypeVal.toLowerCase() == "mcq" || questionTypeVal.toLowerCase() == "fill in the blanks" || questionTypeVal.toLowerCase() == "true/false" ){
		 	if(jQuery(this).is(":checked")){
		 		jQuery(".check_box").not(this).prop('checked', false);
		 	}
		 }
		
	});
});

