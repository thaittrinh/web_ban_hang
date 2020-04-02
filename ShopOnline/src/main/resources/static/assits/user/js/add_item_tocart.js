
$(document).ready(function() {

	var carts = JSON.parse(localStorage.getItem("carts"));// no brackets
	
	$('#buyNow').on('click', function() {

		var object = {
			id : $('#idProduct').text(),
			name : $('#nameProduct').text(),
			price : $('#priceProduct').text()
		};
		// kiểm tra sản phẩm có trong giỏ hàng chưa
		if (carts == null) {
			object.quantity = 1;
			carts=[];
			carts.push(object);		
			window.localStorage.setItem("carts", JSON.stringify(carts));
		} else {
			var check = false;
			var i = 0
			for (i; i < carts.length; i++) {
				if (carts[i].id == object.id) {
					check = true;
					break
				}
			}

			if (check) {// tăng số lượng sp lên khi sp đã có trong giỏ hàng
				carts[i].quantity += 1;
			} else {
				object.quantity = 1;
				carts.push(object);
			}
		
		}
		//lưu giỏ hàng dưới dạng sessionStorage
		window.localStorage.setItem("carts", JSON.stringify(carts));	
	});
});