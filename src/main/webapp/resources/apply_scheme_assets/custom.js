function CheckFileType(cntr, ftype) {
	// Get the file upload control file extension
	var extn = $('#' + cntr).val().split('.').pop().toLowerCase(); 
	if (extn != '') {
		//debugger;        
		   // Create array with the files extensions to upload
		   var fileListToUpload;  
		   if (parseInt(ftype) == 1){
		       fileListToUpload = new Array('pdf', 'gif', 'jpg', 'jpeg', 'png');
		   }
		   else if (parseInt(ftype) == 2){
		       fileListToUpload = new Array('png', 'jpg', 'jpeg');
		   }
		   else{
		       fileListToUpload = new Array('pdf');	
		   } 
		   //Check the file extension is in the array.               
		   var isValidFile = $.inArray(extn, fileListToUpload);		        
		   // isValidFile gets the value -1 if the file extension is not in the list.  
		   if (isValidFile == -1) {	        	
		       if (parseInt(ftype) == 1){
		          bootbox.alert("Please select a valid file of type pdf, gif, jpg, jpeg, png."); 
		       }
		       else if (parseInt(ftype) == 2){ 
		          bootbox.alert("Please select a valid file of type png, jpg or jpeg."); 
		       }
		       else{
		          bootbox.alert("Please select a valid pdf file only."); 
		       } 
		       $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));
		   } 
		   else {
		       // Restrict the file size to 500 KB.
		       if ($('#' + cntr).get(0).files[0].size > (1024 * 500)) {
		           bootbox.alert("File size should not exceed 500 KB.");		           
		           $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));
		           $("#uph").attr('src','resources/admin_pannel/images/profile_pic.png'); 
		           $("#uphOther").attr('src','resources/admin_pannel/images/profile_pic.png'); 
		       }
		       if ($('#' + cntr).get(0).files[0].name.length > 100) {
		           bootbox.alert("File name should be maximum 100 characters."); 
		           $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));		       
		       } 
		       else {
		           return true;
		       }
		   }
	}
	else {
	   return true;
	} 
}  
function validateNumber() { 
	if((event.keyCode<48 || event.keyCode>57))
	{
		event.returnValue = false;
	} 
}  
function ValidateEmail(cntr) {
    var email = $('#' + cntr).val();
    //alert(email);
    if (email != "") {
        var reg = /^[A-Za-z0-9]([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
        if (!reg.test(email)) {
        	bootbox.alert('Enter a valid email id'); 
            return false;
        }
        else
            return true;
    }
    else
        return true;
}; 
