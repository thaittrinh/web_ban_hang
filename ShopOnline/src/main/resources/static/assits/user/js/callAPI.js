	
	/*
	 * put mapping
	 */

function PutMapping(path,data){
	$.ajax({
		url : path,
		type : 'PUT',
		dataType : 'json', // kiểu dữ liệu server trả về, result là kết quả
		data: data,
		success : function(result) {
			return result
		},
		error : function(error) {					
			console.log(error);
			return null;
		}
	});
	
}


