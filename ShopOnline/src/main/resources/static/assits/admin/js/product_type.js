var UIController = (function() {
    var DOMString = {
        tbody : "tbody",
        inputSearch : "#search", //querySelector id
        selecterSize : "#items",
        inputId : "id",	//name
        inputName : "name",
        checkboxDelete : "Ids",
        btnCreateNew : "create_new",//getElementById
        btnInsert : "insert",
        btnUpdate : "update",
        btnDelete : "delete",
        btnMultipleDelete: "multiple_delete",

    };
    
    return {
        displayPrdTypes: function(product_types) {
            var tbd = document.querySelector(DOMString.tbody);
            while (tbd.hasChildNodes()) {
                tbd.removeChild(tbd.firstChild);
            }

            for (let i = 0; i < product_types.length; i++) {
                var newRow = tbd.insertRow();

                var cell0 = newRow.insertCell(0);
                var cell1 = newRow.insertCell(1);
                var cell2 = newRow.insertCell(2);

                cell0.innerHTML = product_types[i].id;
                cell0.onclick = clickRow;
                cell1.innerHTML = product_types[i].name;
                cell1.onclick = clickRow;
                cell2.innerHTML = `<input type="checkbox" name="Ids"  value="${product_types[i].id}">`;
            }
        },
        
        fillToForm : function(object){
        	
        	var inputId = document.getElementsByName(DOMString.inputId)[0];
        	var inputName = document.getElementsByName(DOMString.inputName)[0];
        	
        	if(object){
        		inputId.value = object.id;
        		inputName.value = object.name;
        	}else{
        		inputId.value = "";
        		inputName.value = "";
        	}
        		
        },
        
        getForm : function(){
        	return{
        		id : document.getElementsByName(DOMString.inputId)[0].value,
            	name : document.getElementsByName(DOMString.inputName)[0].value
        	}       	
        },
        
        getIds : function(){
        	var Ids = [];
        	var elements = document.getElementsByName(DOMString.checkboxDelete);
        	for(var i = 0; i < elements.length ; i++){       	
        		if(elements[i].checked){
        			Ids.push(elements[i].value);
        		}       		      		
        	}  	
        	return Ids;
        },
        // visible or unable button or clean form
         isInsert : function(bolean){
        	document.getElementById(DOMString.btnInsert).disabled = !bolean;
        	if(bolean){
        		this.fillToForm(null);
        	};
     
        	document.getElementById(DOMString.btnUpdate).disabled = bolean;
        	document.getElementById(DOMString.btnDelete).disabled = bolean;
        	
        },
        
        getDOMString: function() {
            return DOMString;
        }

    }
})();



var controller = (function(UIctrl) {
	 var DOM, name, size, producTypes;
		 DOM = UIctrl.getDOMString(); 
		 name = document.querySelector(DOM.inputSearch).value;
	     size = document.querySelector(DOM.selecterSize).value;
	     producTypes = [];
	     index = -1; 
	     
   	
    /*
     * set up all event
     */ 
    var setupEventListener = function() {
    	
    	// search
    	var  node = document.querySelector(DOM.inputSearch);	
    	node.addEventListener("keyup", function(event) {
    	    if (event.key === "Enter") {
    	    	name = document.querySelector(DOM.inputSearch).value;
    	    	getConnection('api/product_type?size='+ size +'&&page=1&&name=' + name, findAll); 
    	    }
    	});
    	  
    	// change size
       document.querySelector(DOM.selecterSize).addEventListener('change', function(){
    	   size = document.querySelector(DOM.selecterSize).value;
           getConnection('api/product_type?size='+ size +'&&page=1&&name=' + name, findAll); 
       });
         
       //create new UIctrl.isInsert(true)
       document.getElementById(DOM.btnCreateNew).addEventListener('click',function(){
    	   UIctrl.isInsert(true)
       });
             
       // insert
       document.getElementById(DOM.btnInsert).addEventListener('click',function(){
    	 	
           postConnection("api/product_type", UIctrl.getForm(), instSuccess);     	
       });
       
       //update
       document.getElementById(DOM.btnUpdate).addEventListener('click', function(){
    	   
    	   putConnection("api/product_type", UIctrl.getForm(), updateSuccess);
       });
       
       //deletes
       document.getElementById(DOM.btnMultipleDelete).addEventListener('click', function(){
    	   var ids = UIctrl.getIds();
    	   if(ids){
    		   deletConnection("api/product_type",UIctrl.getIds(),function(){
        		   getConnection(`api/product_type?name=${name}&&page=1&&size=${size}`, findAll); 	     
    	     });
    	   }
       });
       
       // delete
       document.getElementById(DOM.btnDelete).addEventListener('click', function(){
    	   var object = UIctrl.getForm();
    	   if(object){
    		   deletConnection("api/product_type",[object.id],function(){
    			    
        		   getConnection(`api/product_type?name=${name}&&page=1&&size=${size}`, findAll); 
        		   
        		// announce success   	 
   		    	 sweetalert(true,"Xóa thành công");
   		    	 
   		    	 //
   		    	UIctrl.isInsert(true);
    	     });
    	   }
       });
        	      
    };

    /*
     * Get mapping
     */ 
    var findAll = function(result) {

    	producTypes = result.content;
    	
        // Display all product type;
        UIctrl.displayPrdTypes(producTypes);

        // set up page
        setUpPage(result);

    };
    

    //insert success
     var instSuccess = function(){
    	 // reload page
    	 getConnection(`api/product_type?name=${name}&&page=1&&size=${size}`, findAll);
    	 
    	 // announce success   	 
    	 sweetalert(true,"Thêm mới thành công");
     	
    	 // 
     	 UIctrl.isInsert(true);
     };
    
     
	 /*
	  * update success
	  */
  var updateSuccess = function(result){
	  //
	  producTypes[index] = result;
	  
	  //create new row table
	  UIctrl.displayPrdTypes(producTypes);
	  
	  // announce success   	 
 	 sweetalert(true,"Cập nhật thành công");
  }
     
    /*
     * set up page
     */
    var setUpPage = function(data) {
    	$('#pagination').twbsPagination('destroy'); // create new pagination
  	      
        $('#pagination').twbsPagination({
            totalPages: data.totalPages,
            startPage: data.number + 1,
            visiblePages: 3,
            hideOnlyOnePage: true,
        }).on('page', function(event, page) {
            getConnection('api/product_type?size='+ size +'&&page=' + page + '&&name=' + name, findAll);
        });
    };

    return {
        init: function() {      
        	getConnection(`api/product_type?name=${name}&&page=1&&size=${size}`, findAll);
            setupEventListener();
            UIctrl.isInsert(true);
            clickRow = function(element){ 
               	index = element.toElement.parentNode.rowIndex -1;  	
               	UIctrl.fillToForm(producTypes[index]);
               	UIctrl.isInsert(false);
             }
        }
    }
})(UIController);

controller.init();

