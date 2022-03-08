function showModal(modalClass=""){
	$("body").addClass("modal--opened");
	$("#modal").attr("class", "modal " + modalClass);
	$("#modal-injected_content").focus();
}

function closeModal(){
	if(document.hasFocus()){
		$("body").removeClass("modal--opened");
	}
}

function injectInModal(content, modalClass=""){
	$("#modal-injected_content").html(content);
	showModal(modalClass);
}
