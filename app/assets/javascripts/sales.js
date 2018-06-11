function filter(id_input, id_table, index) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(id_input);
  filter = input.value.toUpperCase();
  table = document.getElementById(id_table);
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[index];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}


function populateField(id_field, content) {
  var input;
  input = document.getElementById(id_field);
  input.value = content;
}

function addProduct(product) {
  do {  
    qty = prompt("Qual a quantidade do produto?", "1");
  }   while (qty == null || qty == "");
  _products = $("#products");
  product.qty = qty;
  total_items = _products.find("tr");
  next_id = "item1";
  valor_total = product.value * product.qty;
  if (total_items.length > 0){
    current_id = total_items[total_items.length-1].id;
    next_id = "item" + (parseInt(current_id.split("item")[1]) + 1) ; 
  }
  _products.append("<tr id='"+ (next_id) +"'> \
                    <td>" + product.id + "</td> \
                    <td>" + product.description + "</td> \
                    <td>" + product.value + "</td> \
                    <td>" + product.qty + "</td> \
                    <td class='valor_total'>" + valor_total + "</td> \
                    <td> \
                      <input type='button' value='Remover' class='btn btn-outline-danger' onclick='removeItem(\""+next_id+"\")'> </td> \
                  </tr>");
  updateTotal();
}

function removeItem(id) {
  document.getElementById(id).remove();
  updateTotal();  
}

function updateTotal() {
  var total = 0;
  var all_items = $(".valor_total");
  for (i = 0; i < all_items.length; i++) {
    total += parseFloat(all_items[i].textContent);
  }
  $("#total")[0].value = "R$ " + total;
}

function formSubmit() {
  client_id = $("#client_id")[0].value;
  if (client_id == null || client_id == ""){
    alert("Necessário selecionar o cliente.");
    $("#selectClientModal").modal('show');
  }
  else{
    total = $("#total")[0].value;
    if (total == null || total == "" || total == "R$ 0"){
      alert("Necessário selecionar os produtos");
      $("#addProductModal").modal('show');
    }
    else
    {
      createHiddenInputs(client_id);
      $("#new_sale").submit();
    }
  }
}

function createHiddenInputs(client_id){
  _products = $("#products");
  _items = _products.find("tr");
  _fields = $("#fields");
  for (i = 0; i < _items.length; i++) {
    _tds = _items[i].getElementsByTagName("td");
    _fields.append('<input type="hidden" name="items['+ _items[i].id +'[id]]" value="'+_tds[0].innerHTML+'">');
    _fields.append('<input type="hidden" name="items['+ _items[i].id +'[qty]]" value="'+_tds[3].innerHTML+'">');
    _fields.append('<input type="hidden" name="items['+ _items[i].id +'[value]]" value="'+_tds[2].innerHTML+'">');
  }
  _total = $("#total")[0].value.split(" ")[1];
  _fields.append('<input type="hidden" name="sale[value]" value="'+ _total+ '">');
  _fields.append('<input type="hidden" name="sale[date]" value="'+ Date.now()+ '">');
  _fields.append('<input type="hidden" name="sale[client_id]" value="'+ client_id + '">');
  
}
