// Met onderstaande code word het hamburger menu aangestuurd zodra het scherm de 1000pixels aanraakt.
const menuLinks = document.getElementById("menuLinks");

const menuButton = document.getElementById("menuButton");
menuButton.addEventListener("click", toggleMenu);

function toggleMenu() {
  if (menuLinks.style.display === "block") {
    menuLinks.style.display = "none";
  } else {
    menuLinks.style.display = "block";
  }
}

// Als het menu weggeklikt is en daarna wordt de pagina weer als desktop-versie bekeken, blijft het menu weg.
// Onderstaande JavaScript code onderzoekt of de pagina weer voorbij de media-query is en toont dan het menu weer.
const mediaQuery = window.matchMedia("(min-width: 1000px)");

function handleTabletChange(e) {
  if (e.matches) {
    menuLinks.style.display = "block";
  }
}

mediaQuery.addListener(handleTabletChange);
handleTabletChange(mediaQuery);

// Javascript die bekijkt of de webpagina nog aan het laden is + 
// functies die gelijk klaar moeten zijn bij open pagina

if (document.readyState == "loading") {
    document.addEventListener("DOMContentLoaded", ready)
} else {
    ready()
}

function ready() {
    // voorladen functie remove buttons
    var removeCartItemBut = document.getElementsByClassName("buttonRemove")
    for (var i = 0; i < removeCartItemBut.length; i++) {
        var btn = removeCartItemBut[i]
        btn.addEventListener("click", removeCartItem) 
    }  
    // voorladen functie van invoeren quantity
    var quantityInputs = document.getElementsByClassName("cartQuantityInput")
    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i]
        input.addEventListener("change", quantityChanged)
    }

    document.getElementsByClassName("buttonPurchase")[0].addEventListener("click", purchaseClicked)
}


// Updaten winkelmandje met onload op moment van het laden van de pagina

window.onload = loadItemInCart()
window.onload = updateCartSubTotal()
window.onload = ready()
window.onload = updateTaxPrice()
window.onload = updateTotalPrice()


// Met deze functie word het winkelmandje gevult met de data in de localstorage

function loadItemInCart() {
    var cartData = JSON.parse(localStorage.getItem('cartData'));
	
	for(var i = 0; i < cartData.length; i++)
	{
		var cartRow = document.createElement("div")
		cartRow.classList.add("cartRow")
		var cartItems = document.getElementsByClassName("cartItems")[0]
		var cartRowContents = `        
		<div class="cartItem cartColumn">
		<img class="cartItemImage" src="${cartData[i].img}" width="100" height="100">
		<span class="cartItemTitle">${cartData[i].name}</span>
		</div>
		<span class="cartPrice cartColumn">${cartData[i].price}</span>
		<div class="cartQuantity cartColumn">
		<input class="cartQuantityInput" type="number" value="${cartData[i].quantity}">
		<button class="button buttonRemove" type="button">REMOVE</button>
		</div>`
		cartRow.innerHTML = cartRowContents
		cartItems.append(cartRow)
	}
}




// Bij het klikken op remove in de shoppingcart word het item verwijderd (dit werkt nu)

function removeCartItem(event) {
        var buttonClicked = event.target
        buttonClicked.parentElement.parentElement.remove()
        updateCartSubTotal()
        updateTaxPrice()    
        updateTotalPrice()  
}


// Sub totaal aanpassen op basis van item in de shopping cart (dit werkt nu)

function updateCartSubTotal() {
    var cartRows = document.querySelectorAll(".cartItems .cartRow");
    var subTotal = 0
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i]
        var priceElement = cartRow.getElementsByClassName("cartPrice")[0]
        var quantityElement = cartRow.getElementsByClassName("cartQuantityInput")[0]
        var price = parseFloat(priceElement.innerText.replace("€", ""))
        var quantity = quantityElement.value
        subTotal = subTotal + (price * quantity)
    }
    subTotal = Math.round(subTotal *100) / 100
    document.getElementsByClassName("cartSubTotal")[0].innerText = "€" + subTotal
}

// Sub totaal aanpassen op het moment dat de quantity word verhoogd. (Dit werkt nu)

function quantityChanged(event) {
    var input = event.target
    if(isNaN(input.value) || input.value <= 0) {
        input.value = 1
    }
    updateCartSubTotal()
    updateTaxPrice()  
    updateTotalPrice()  
}


// Melding bedankt voor het kopen bij klikken op kopen (dit werkt nu) toevoegen dat als het mandje leeg is je geen purchase kan klikken

function purchaseClicked() {
    if (document.getElementsByClassName("cartItems")[0].hasChildNodes()){
        alert("Thank you for your purchase")
        var cartItems = document.getElementsByClassName("cartItems")[0]
        while (cartItems.hasChildNodes()) {
            cartItems.removeChild(cartItems.firstChild)
        }
    }
    else {
        alert("There is nothing in your cart!")
    }
    updateCartSubTotal()
    updateTaxPrice() 
    updateTotalPrice()
    removeLocalStorage()
    
}



// tax berekenen 

function updateTaxPrice() {
    var taxTotal = 0
      {
        
        var priceElement = document.getElementsByClassName("cartSubTotal")[0]
        var price = parseFloat(priceElement.innerText.replace("€", ""))
        taxTotal = taxTotal + (price * 0.21)
    }
    taxTotal = Math.round(taxTotal *100) / 100
    document.getElementsByClassName("cartTaxTotal")[0].innerText = "€" + taxTotal
}

// total berekenen 

function updateTotalPrice() {
    var cartTotalPrice = 0
        {
            var priceSubTotal = document.getElementsByClassName("cartSubTotal")[0]
            var priceTaxTotal = document.getElementsByClassName("cartTaxTotal")[0]
            var sub = parseFloat(priceSubTotal.innerText.replace("€", ""))
            var tax = parseFloat(priceTaxTotal.innerText.replace("€", ""))
            cartTotalPrice = cartTotalPrice + (sub + tax)
    }
    cartTotalPrice = Math.round(cartTotalPrice *100) / 100
    document.getElementsByClassName("cartTotalPrice")[0].innerText = "€" + cartTotalPrice
}

// Localstorage verwijderen op het moment van kopen

function removeLocalStorage(){
    localStorage.clear()
}