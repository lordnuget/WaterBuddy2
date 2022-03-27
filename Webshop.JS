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


// Webshop pagina

// Item toevoegen aan de shopping cart in Navigatie balk op de webshop pagina. Elke keer als er 
// add to cart word geklikt zal de teller omhoog gaan naast het winkelmandje.

var noti = document.querySelector("h4")
var button = document.querySelectorAll(".buttonBuyNowBasic, .buttonBuyNowPro")
for(but of button)
{
    but.addEventListener('click', (e)=>{
        var add = Number(noti.getAttribute("data-count")|| 0)
        noti.setAttribute("data-count", add + 1)
        noti.classList.add("zero")
    })
}

// regel toevoegen aan het winkelmandje via een json string en local storage word deze opgeslagen en in 
// basket pagina word deze data opnieuw opgehaald

function addItemToCart(e) {
    
	var price = e.target.getAttribute("data-price");
	var name = e.target.getAttribute("data-name");
	var img = e.target.getAttribute("data-img");
	var products = [];
	
	if ( localStorage.getItem('cartData') === null )
	{
		products = [
			{
				"price" : price,
				"name" : name,
				"img" : img,
				"quantity" : 1
			}
		];
	} else {
		products = JSON.parse(localStorage.getItem('cartData'));
		
		var includesNameIndex = false;
		for(var i = 0; i < products.length; i++)
		{
			if ( products[i].name == name )
				includesNameIndex = i;
		}
		
		if (includesNameIndex !== false)
			products[includesNameIndex].quantity++;
		else {
			products.push(
				{
					"price" : price,
					"name" : name,
					"img" : img,
					"quantity" : 1
				}
			);
		}
	}
	
	localStorage.setItem('cartData', JSON.stringify(products));
}

var buttonBasicAddToCart = document.querySelectorAll(".buttonBuyNowBasic, .buttonBuyNowPro")

for(var i = 0; i < buttonBasicAddToCart.length; i++){
	buttonBasicAddToCart[i].addEventListener("click", addItemToCart)
};


// Moment dat er op de download knop word gedrukt komt er een bedankt voor downloaden melding

function downloadClicked() {
	alert("Thanks for downloading our app")
}

document.getElementsByClassName("buttonFooter")[0].addEventListener("click", downloadClicked)
document.getElementsByClassName("buttonFooter")[1].addEventListener("click", downloadClicked)
