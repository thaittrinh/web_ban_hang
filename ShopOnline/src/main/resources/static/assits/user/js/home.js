/*$(document).ready(
		function() {	
 * kiểm tra độ dài của bộ chọn, nếu nó trả về một cái gì đó thì phần
 * tử phải tồn tại. if( $('#products').length ) {
 * $("#products").ready(function(){select()}); }
 * 	});
 */

var type = 0;

$("#products").ready(function() {
	select('/find_all_product?type=')
});

function findByType(element) {
	type = element.getAttribute("value");
	$('#pagination').twbsPagination('destroy');
	select('/find_all_product?type=')
}


/*
 * show danh sách sản phẩm
 */
function innert(result) {
	var text = '';
	for (var i = 0; i < result.data.content.length; i++) {
		var object = result.data.content[i];
		text = text + " <a href='" + object.id + "' class='col-sm-4'>"
				+ "<div class='image'>" + "<img src='assits/images/products/"
				+ object.photo + "' alt='Loading...'>" + "</div>" + "<br/>"
				+ "<div class='name'>" + "<h4>" + object.name + "</h4>"
				+ "</div>" + "<div class='title'>" + object.descriptions
				+ "</div>" + "<div class='price'>" + " <strong>" + object.price
				+ "</strong>" + " </div></a>"
	}
	$('#products').html(text);

}

function page(result) {
	window.pagObj = $('#pagination').twbsPagination({
		totalPages : result.data.totalPages,
		startPage : result.data.number + 1,
		visiblePages : 3,
		hideOnlyOnePage : true,

	}).on('page', function(event, page) {
		select('/find_all_product?page=' + page + '&&type=')

	});
}


function select(response) {
	var path = url + response + type;   ///url trong head.html /muasamtructuyen.com/
	$.ajax({
		url : path,
		type : 'GET',
		dataType : 'json', // kiểu dữ liệu server trả về, result là kết quả
		success : function(result) {
			innert(result);
			page(result)
		},
		error : function(error) {
			console.log(error);
		}
	});
}