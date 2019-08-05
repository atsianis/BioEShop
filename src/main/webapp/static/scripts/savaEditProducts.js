// Arrays
let cupMaterials = ["Bamboo", "Steel", "Hard paper", "Wood"];
let strawMaterials = ["Bamboo", "Steel", "Hard paper", "Glass"];
let toothbrushMaterials = ["Bamboo", "Wood", "Plant-based plastic"];
let cupSizes = ["100ml", "200ml", "250ml", "400ml", "500ml", "750ml", "1000ml"];
let strawSizes = ["3'", "5'", "7'"];
let toothbrushSizes = ["Kids", "Adults", "Pocket-size"];
let colors = ["AliceBlue", "AntiqueWhite", "Aqua", "Aquamarine", "Azure", "Beige", "Bisque", "Black", "BlanchedAlmond", "Blue", "BlueViolet", "Brown", "BurlyWood", "CadetBlue", "Chartreuse", "Chocolate", "Coral", "CornflowerBlue", "Cornsilk", "Crimson", "Cyan", "DarkBlue", "DarkCyan", "DarkGoldenRod", "DarkGray", "DarkGrey", "DarkGreen", "DarkKhaki", "DarkMagenta", "DarkOliveGreen", "DarkOrange", "DarkOrchid", "DarkRed", "DarkSalmon", "DarkSeaGreen", "DarkSlateBlue", "DarkSlateGray", "DarkSlateGrey", "DarkTurquoise", "DarkViolet", "DeepPink", "DeepSkyBlue", "DimGray", "DimGrey", "DodgerBlue", "FireBrick", "FloralWhite", "ForestGreen", "Fuchsia", "Gainsboro", "GhostWhite", "Gold", "GoldenRod", "Gray", "Grey", "Green", "GreenYellow", "HoneyDew", "HotPink", "IndianRed", "Indigo", "Ivory", "Khaki", "Lavender", "LavenderBlush", "LawnGreen", "LemonChiffon", "LightBlue", "LightCoral", "LightCyan", "LightGoldenRodYellow", "LightGray", "LightGrey", "LightGreen", "LightPink", "LightSalmon", "LightSeaGreen", "LightSkyBlue", "LightSlateGray", "LightSlateGrey", "LightSteelBlue", "LightYellow", "Lime", "LimeGreen", "Linen", "Magenta", "Maroon", "MediumAquaMarine", "MediumBlue", "MediumOrchid", "MediumPurple", "MediumSeaGreen", "MediumSlateBlue", "MediumSpringGreen", "MediumTurquoise", "MediumVioletRed", "MidnightBlue", "MintCream", "MistyRose", "Moccasin", "NavajoWhite", "Navy", "OldLace", "Olive", "OliveDrab", "Orange", "OrangeRed", "Orchid", "PaleGoldenRod", "PaleGreen", "PaleTurquoise", "PaleVioletRed", "PapayaWhip", "PeachPuff", "Peru", "Pink", "Plum", "PowderBlue", "Purple", "RebeccaPurple", "Red", "RosyBrown", "RoyalBlue", "SaddleBrown", "Salmon", "SandyBrown", "SeaGreen", "SeaShell", "Sienna", "Silver", "SkyBlue", "SlateBlue", "SlateGray", "SlateGrey", "Snow", "SpringGreen", "SteelBlue", "Tan", "Teal", "Thistle", "Tomato", "Turquoise", "Violet", "Wheat", "White", "WhiteSmoke", "Yellow", "YellowGreen"];

// Image HTML inputs
let imageInput = document.querySelector("#path");
let imagePreview = document.querySelector("#imagePreview");

// Category, Color, Size, Material HTML inputs
let categoryInput = document.querySelector("#category");
let colorSelectInput = document.querySelector("#color");
let sizeSelectInput = document.querySelector("#size");
let materialSelectInput = document.querySelector("#material");

// Initial values, in case of editing existing product
let imageInit = document.querySelector("#imageInit");
let colorInit = document.querySelector("#colorInit");
let sizeInit = document.querySelector("#sizeInit");
let materialInit = document.querySelector("#materialInit");


categoryInput.addEventListener("change", handleChange);
window.addEventListener("load", handleOnload);
imageInput.addEventListener("change", handleImage);

/* handleChange is invoked every time the category select changes value.
 It is also invoked on window.load event, in case of editing an existing product.
 It changes the select options for Materials and Sizes.
 */
function handleChange() {
    if (categoryInput.value === "Cup") {
        materialSelectInput.innerHTML = "";
        cupMaterials.forEach(function (element) {
            let option = document.createElement('option');
            option.innerHTML = "<option value='" + element + "'>" + element + "</option>";
            materialSelectInput.appendChild(option);
        });

        sizeSelectInput.innerHTML = "";
        cupSizes.forEach(function (element) {
            let option = document.createElement('option');
            option.innerHTML = "<option value='" + element + "'>" + element + "</option>";
            sizeSelectInput.appendChild(option);
        });

    } else if (categoryInput.value === "Straw") {
        materialSelectInput.innerHTML = "";
        strawMaterials.forEach(function (element) {
            let option = document.createElement('option');
            option.innerHTML = "<option value='" + element + "'>" + element + "</option>";
            materialSelectInput.appendChild(option);
        });

        sizeSelectInput.innerHTML = "";
        strawSizes.forEach(function (element) {
            let option = document.createElement('option');
            option.innerHTML = "<option value='" + element + "'>" + element + "</option>";
            sizeSelectInput.appendChild(option);
        });
    } else if (categoryInput.value === "Toothbrush") {
        materialSelectInput.innerHTML = "";
        toothbrushMaterials.forEach(function (element) {
            let option = document.createElement('option');
            option.innerHTML = "<option value='" + element + "'>" + element + "</option>";
            materialSelectInput.appendChild(option);
        });

        sizeSelectInput.innerHTML = "";
        toothbrushSizes.forEach(function (element) {
            let option = document.createElement('option');
            option.innerHTML = "<option value='" + element + "'>" + element + "</option>";
            sizeSelectInput.appendChild(option);
        });
    }
}

/* handleChange is invoked every time the category select changes value.
 It changes the select options for Materials and Sizes.
 */
function handleImage() {
    imagePreview.setAttribute("src", imageInput.value);
}

/*
 handleOnload() is invoked every time the window loads. In case of editing
 an existing product, the product category is already selected (backend variable sent) (a).
 The existing product also initializes the hidden input values for color, size, material.
 Due to (a), the handleChange() creates the correct options. After this,
 the handleOnload() does the following:
 - it creates the color options
 - searches for matching values for the Sizes, Colors, and Materials comparing to the initial values.
 and sets the "selected" attribute for the matching value.
 */
function handleOnload() {
    handleImage();
    handleChange();

    // Populating color options
    colorSelectInput.innerHTML = "";
    colors.forEach(function (element) {
        let option = document.createElement('option');
        option.innerHTML = "<option value='" + element + "'>" + element + "</option>";
        colorSelectInput.appendChild(option);
    });

    // Initialize size value
    let sizesLength = sizeSelectInput.options.length;
    for (i = 0; i < sizesLength; i++) {
        if (sizeSelectInput.options[i].value === sizeInit.value) {
            console.log(sizeInit);
            sizeSelectInput.options[i].setAttribute("selected", true);

        }
    }

    // Initialize color value
    let colorsLength = colorSelectInput.options.length;
    for (i = 0; i < colorsLength; i++) {
        if (colorSelectInput.options[i].value === colorInit.value) {
            console.log(colorInit);
            colorSelectInput.options[i].setAttribute("selected", true);

        }
    }

    // Initialize material value
    let materialsLength = materialSelectInput.options.length;
    for (i = 0; i < materialsLength; i++) {
        if (materialSelectInput.options[i].value === materialInit.value) {
            console.log(materialInit);
            materialSelectInput.options[i].setAttribute("selected", true);
        }
    }
}
