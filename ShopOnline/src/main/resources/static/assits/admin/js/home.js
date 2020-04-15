
/*<script type="text/javascript" th:inline="javascript">
			 const URL = [[@{'/'}]]; 	 
</script>*/
/**
 * Call API
 */

// The GetMapping
 
  var getConnection = (function(path,fnc){
  
	  $.ajax({
		  url : URL + path,
		  type : 'GET',
		  dataType : 'json', // kiểu dữ liệuserver trả về, result là kết quả 
	      success : function(result) {// 200 / result đã chuyển từ json về object    
		   fnc(result);
	    	  
		   },
	      error : function(error) {// 500,400... //console.log(error); //console.log(error.status);
	    	  console.log(error);
	    	  sweetalert(false,error.responseJSON.message);
		   } 
	});
  
  });


// The GetMapping
var postConnection = (function(path, data, fnc){
	
		$.ajax({
	         type: 'post',
	         url: URL + path,
	         contentType: "application/json",
	         cache: false,
	         data: JSON.stringify(data),	        
	         success: function (result) {
	            // console.log(result)
	              fnc()
	         },
	         error: function ( error) {
	        	console.log(error);
	        	sweetalert(false,error.responseJSON.message);
	         }
	     });
		
	
});


// The PutMapping
var putConnection = (function(path, data,fnc){
	
	 $.ajax({
         type: 'put',
         url: URL + path,
         contentType: "application/json",
         cache: false,
         data: JSON.stringify(data),
         success: function (result) {  
             fnc(result);
         },
         error: function (error) {
        	 console.log(error);
        	 sweetalert(false,error.responseJSON.message);
         }
     });
	
});

// The DeleteMapping
var deletConnection = (function(path, data,fnc){
	var arr =[];
	 $.ajax({
         type: 'delete',
         url: URL + path,
         contentType: "application/json",
         cache: false,
         data: JSON.stringify(data),
         success: function (result) {  
             fnc();
         },
         error: function (error) { 	 
        	 console.log(error);
        	 sweetalert(false,"Lỗi server");
         }
     });
});


// Announce
var sweetalert = (function(bolean, message){
		if(bolean){ //success
			Swal.fire(
					message,
					  '',
					  'success'
					)	
		}else{ // error
			 Swal.fire({
				   icon: 'error',
				   title: message,		 
				 })
		}  
});
