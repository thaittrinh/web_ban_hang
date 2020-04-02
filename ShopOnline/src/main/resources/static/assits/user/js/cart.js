$(document).ready(function() {

			//localStorage.removeItem("carts");
			var carts = JSON.parse(localStorage.getItem("carts"));

			fillToTable();

			// remove item form cart	
			$(document).on('click','.remove' , function(){		
				var index =  $(this).parent().parent().index();	
				carts.splice(index,1);
				window.localStorage.setItem("carts", JSON.stringify(carts));
				fillToTable();			
			});
				
			// clear  cart
			$('#clear').on('click', function(){		
				localStorage.removeItem('carts');
				carts = [];
				fillToTable();			
			});
			
			// change quantity
			$(document).on('change','#quantity' , function(){	
				var index =  $(this).parent().parent().index();
			     carts[index].quantity = $(this).val();
			     window.localStorage.setItem("carts", JSON.stringify(carts));
			     fillToTable();	
			});			
			
			// fill to table		
			function fillToTable() {						
				if (carts === null || carts.length === 0) {//giỏ hàng trống
					document.getElementById("myTable").remove();
					document.getElementById("clear").remove();
					document.getElementById("checkOut").remove();		
					$('#imageEmpty').show();
				} else {
					var tbd = document.getElementById("myTable").children[1];
					
					while (tbd.hasChildNodes()) {
						 tbd.removeChild(tbd.firstChild);
					    }
					
					var i = 0;
					var totalPrice = 0;
					for (i; i < carts.length + 1; i++) {

						var newRow = tbd.insertRow();

						var cell0 = newRow.insertCell(0);
						var cell1 = newRow.insertCell(1);
						var cell2 = newRow.insertCell(2);
						var cell3 = newRow.insertCell(3);
						var cell4 = newRow.insertCell(4);
						
						if(i<carts.length){
							var priceT = carts[i].price * carts[i].quantity;
							totalPrice += priceT;
							
							cell0.innerHTML = carts[i].name;
							cell1.innerHTML = "<input id='quantity' type='number' min='0' value='"+carts[i].quantity+"' style='width: 50px;'>";	
							cell2.innerHTML = carts[i].price;
							cell3.innerHTML = priceT;
							cell4.innerHTML = "<button  type='button' class='remove btn btn-danger' style='height: 25px; width: 90px; padding: 0px;' value='"
									+ carts[i].id + " '>Remove</button>";								
						}else{
							cell2.innerHTML ='<strong>Grand Total</strong>';
							cell3.innerHTML = "<strong>"+ totalPrice + "</strong>" ;
					
						}
						
					}
					
					$('#imageEmpty').hide(); 			
			}
	}
	
	//================================== CHECK OUT===========================================
			
	
			
			
});