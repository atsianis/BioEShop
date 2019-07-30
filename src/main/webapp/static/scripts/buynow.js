let productsNodeList = document.querySelectorAll(".product");
let products = [];
let totalOutput = document.querySelector("#totalOutput");


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

    products[idOfProduct - 1].quantity = e.value;
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