let productsNodeList = document.querySelectorAll(".product");
let products = [];
let totalOutput = document.querySelector("#totalOutput");
let form = document.querySelector("#form");

let input1 = document.forms["form"]["lname"];
let input2 = document.forms["form"]["fname"];
let input3 = document.forms["form"]["address"];
let input4 = document.forms["form"]["phone"];
let input5 = document.forms["form"]["email"];
let pay = document.querySelector("#paypal-button-container");

input1.addEventListener("keyup", validateForm);
input2.addEventListener("keyup", validateForm);
input3.addEventListener("keyup", validateForm);
input4.addEventListener("keyup", validateForm);
input5.addEventListener("keyup", validateForm);

function validateForm() {
    var a = input1.value;
    var b = input2.value;
    var c = input3.value;
    var d = input4.value;
    var e = input5.value;
    if (!((a == null || a == "") || (b == null || b == "") || (c == null || c == "") || (d == null || d == "") || (e == null || e == ""))) {
        pay.removeAttribute("hidden");
    } else {
        pay.setAttribute("hidden","true");
    }
}


productsNodeList.forEach(function (val) {
    product = {
        productId: val.querySelector(".productId").value,
        price: val.querySelector(".price").value,
        quantity: val.querySelector(".quantity").value
    }
    products.push(product);
});
console.log(products);

let total = products.reduce(findTotal, 0);
total = (Math.round(total * 100)) / 100;
totalOutput.innerText = `Total price: ${total} euro`;
function findTotal(accumulator, product) {
    accumulator += product.price * product.quantity;
    return accumulator;
}
console.log("Total is: ", total);


function updateQuantity(e) {
    let idOfProduct = e.id;
    while (idOfProduct[0] === "q") {
        idOfProduct = idOfProduct.substr(1);
    }

    products.forEach(function(product){
        if(product.productId === idOfProduct){
            product.quantity = e.value;
        }
    });
    total = (Math.round((products.reduce(findTotal, 0)) * 100)) / 100;
    totalOutput.innerText = `Total price: ${total} euro`;
    console.log(total);

}

// PAYPAL
paypal.Buttons({
    // Set up the transaction
    createOrder: function (data, actions) {
        return actions.order.create({
            purchase_units: [{
                    amount: {
                        value: total
                    }
                }]
        });
    },

    // Finalize the transaction
    onApprove: function (data, actions) {
        return actions.order.capture().then(function (details) {
            // Show a success message to the buyer
            alert('Transaction completed by ' + details.payer.name.given_name + '!');
            // added by me
            form.submit();
        });
    }
}).render('#paypal-button-container');