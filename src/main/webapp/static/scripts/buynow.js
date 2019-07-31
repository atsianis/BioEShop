let productsNodeList = document.querySelectorAll(".product");
let products = [];
let totalOutput = document.querySelector("#totalOutput");
let form = document.querySelector("#form");

let input1 = document.forms["form"]["lname"];
let input2 = document.forms["form"]["fname"];
let input3 = document.forms["form"]["address"];
let input4 = document.forms["form"]["phone"];
let input5 = document.forms["form"]["email"];
let pay = document.getElementById("paypal-button-container");

form.addEventListener("keyup", validateForm);


window.addEventListener("load", firstValidation);

function firstValidation(){
    console.log("form loaded");
    let a = input1.value;
    let b = input2.value;
    let c = input3.value;
    let d = input4.value;
    let x = input5.value;
    if (((a === null || a === "") || (b === null || b === "") || (c === null || c === "") || (d === null || d === "") || (x === null || x === ""))) {
        console.log("empty form");
        pay.style.display="none";
    } else {
        console.log("filled form");
        pay.style.display="block";
    }
}

function validateForm() {
    console.log("button pressed");
    let a = input1.value;
    let b = input2.value;
    let c = input3.value;
    let d = input4.value;
    let x = input5.value;
    if (((a === null || a === "") || (b === null || b === "") || (c === null || c === "") || (d === null || d === "") || (x === null || x === ""))) {
        console.log("NOT filled form");
        pay.style.display="none";
    } else {
        console.log("filled form");
        pay.style.display="block";
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