$( document ).ready(function() {
	// Handler for .ready() called.
	
	$('#poemSelect').change(function(){
		alert('selected poem: '+ $(this).val());
		var xmlFileName = $(this).val();
		$.ajax({
			type: "GET",
			url: xmlFileName,
			dataType: "xml",
			success: function (xml) {

				// Parse the xml file and get data
				var xmlDoc = $.parseXML(xml)
				$xml = $(xmlDoc);
				alert("found: " + xmlFileName)
				/**/
				$xml.find('title').each(function () {
					$("#work_area").append($(this).text() + "<br />");
				});
				
			}
		});
	});
});