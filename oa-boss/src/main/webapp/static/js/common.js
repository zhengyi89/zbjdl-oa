function clearAllInput(formId){
	var form = document.getElementById(formId);
	$(':input', form).not(':button, :submit, :reset, :hidden, :disabled').val('').removeAttr('checked').removeAttr('selected');
};