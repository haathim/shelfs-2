// var addToCartBtn = document.getElementsByClassName('add-to-cart-button')

// addToCartBtn.addEventListener('click', addToCartClicked)

// function addToCart(event){
//      var button = event.target
//     var cartItem = button.parentElement.parentElement
//     var title = cartItem.getElementById('booktitle')[0].innerText
//     var author = cartItem.getElementById('bookauthor')[0].innerText
//     var price = cartItem.getElementById('price')[0].innerText
//     var img = cartItem.getElementById('image')[0].innerText
//     console.log(title, author, price, img)
// }



window.addEventListener('load', ()=>{
    display()
    updateTotal()

    var removeItem = document.getElementsByClassName('remove-btn')
    
    for (var i = 0; i < removeItem.length; i++) {

        var button = removeItem[i];
        
        button.addEventListener('click', removeCart)

    }
})

function addToCart(){
    var item = [
        // {
        //     title: title,
        //     author: author,
        //     seller: seller,
        //     price: price
        // },
        // {
        //     title: 'Lord of the rings',
        //     author: 'Tolkien',
        //     seller: 'Perera',
        //     price: '200.00'

        // }
    ]

    var existingItems = JSON.parse(localStorage.getItem('cartitem'))

    console.log("Existing items",existingItems)
    if(existingItems == null) var existingItems = []
    var title = document.getElementById('booktitle').innerHTML;
    var author = document.getElementById('bookauthor').innerHTML;
    var seller = document.getElementById('seller').innerHTML;
    var price = document.getElementById('price').innerHTML;
    var adId = document.getElementById('adId').innerHTML

    var book = {
        "title":title,
        "author":author,
        "seller":seller,
        "price":price,
        "adId":adId
    }

    const filteredArray = existingItems.filter(element => {
        if (element.adId === adId) {
            return true;
        }
    });

    if (filteredArray.length > 0) {
        alert("Item already added to the cart")
        return
    }


    //localStorage.setItem("newitem", JSON.stringify(book))
    existingItems.push(book)

    console.log("Ex", existingItems)
    localStorage.setItem("cartitem", JSON.stringify(existingItems));
    localStorage.setItem("cart-Id", JSON.stringify(cartId));
    

    
    console.log(title);
    

    // console.log(localStorage.key(0));

    return;
}


    

function display(){
    let bookitems = localStorage.getItem('cartitem')
    bookitems = JSON.parse(bookitems)
    console.log(bookitems)
    let cartContainer = document.querySelector(".top-box")
    console.log(cartContainer)
    if(bookitems && cartContainer){
        console.log("next step successful")
        cartContainer.innerHTML = '';
        Object.values(bookitems).map(item=>{
            cartContainer.innerHTML += `
            <div class="sub-box" data-adId="${item.adId}">
            <div class="text-box">
            <div hidden class="adId">
                // <div id="adId">${item.adId}</div> 
                
            </div>
            <div class="title">
                <div id="booktitle">${item.title}</div>
            </div>
            
            <div class="author">
                <div id="bookauthor">${item.author}</div>
            </div>
            <div class="description">
                from <div id="seller">${item.seller}</div>
            </div>
        </div>
  
        <div class="book-cover">
            <div class="cover-pic"></div>
        </div>
    
        <div class="price">
            <span id="price">${item.price}</span>
        </div>
        <button type="button" class="view-btn"><i class="fa fa-book"></i>  View</button>
        <button type="button" class="remove-btn"><i class="fa fa-trash"></i>  Remove</button>
    </div>`
        })
    }
    
}

function updateTotal(){
    var cartItemContainer = document.getElementsByClassName('top-box')[0]
    var cartRows = cartItemContainer.getElementsByClassName('sub-box')
    if (cartRows.length === 0){

        document.getElementsByClassName('cart-price')[0].innerText = 'Total - LKR 0.00' ;
        document.getElementById('itemcount').innerText = '0'
        return
    }

    var total = 0
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i]
        var priceElement = cartRow.getElementsByClassName('price')[0]
        var price = parseFloat(priceElement.innerText.replace('LKR',))
        total = total + price
        console.log(priceElement)

    }
    console.log("Nmber:", cartRows.length)
    total = Math.round(total*100)/100
    document.getElementsByClassName('cart-price')[0].innerText = 'Total - LKR ' + total;
    document.getElementById('itemcount').innerText = cartRows.length
}

function removeCart(event) {
    var buttonClicked = event.target
    var cartTile = buttonClicked.parentElement
    var adIdx = cartTile.getAttribute("data-adId")
    console.log("Ad Idx", adIdx)
    cartTile.remove();
    updateTotal()

    var index

    var existingItems = JSON.parse(localStorage.getItem('cartitem'))

    existingItems = existingItems.filter((item) => (item.adId != adIdx));

    console.log("Ex item", existingItems)

    // var cartId = JSON.parse(localStorage.getItem('cart-Id'))
    // var clength = cartId.length
    // for(var i = 0; i < clength; i++){
    //     if(adIdx == cartId[i]){
    //         index = i%clength+1
    //         console.log("Index", index)
    //     }
    // }

    // existingItems = existingItems.splice(index, 1)
    // cartId = cartId.splice(index, 1)

    localStorage.setItem("cartitem", JSON.stringify(existingItems));
    // localStorage.setItem("cart-Id", JSON.stringify(cartId));
    //
    // var cartItemContainer = document.getElementsByClassName('top-box')[0]
    // var cartRows = cartItemContainer.getElementsByClassName('sub-box')
    //
    // for(var i=0; i < cartRows.length; i++){
    //     var cartRow = cartRows[i]
    //     var adId = cartRow.getElementsByClassName('adId')[0].innerText
    //     console.log("Del item id" ,adId)
    //
    //     var existingItems = JSON.parse(localStorage.getItem('cartitem'))
    //     var cartId = JSON.parse(localStorage.getItem('cart-Id'))
    //
    //     for(var j=0; j < cartId.length; j++){
    //         if(adId != cartId[j]){
    //             console.log("cart id", cartId[j])
    //             for(var k=0; k <cartId.length; k++){
    //                 index[k] = j
    //                 console.log("index", index[k])
    //             }
    //             // existingItems = existingItems.splice(index, 1)
    //             // cartId = cartId.splice(index, 1)
    //             // localStorage.setItem("cartitem", JSON.stringify(existingItems));
    //             // localStorage.setItem("cart-Id", JSON.stringify(cartId));
    //         }
    //     }
    //     for(var k=0; k < cartId.length; k++){
    //         existingItems = existingItems.splice(index[k], 1)
    //         cartId = cartId.splice(index[k], 1)
    //     }
    //     if(cartId == undefined){
    //         localStorage.removeItem('cart-Id')
    //         localStorage.removeItem('cartitem')
    //     }




    // console.log("Add Id yo",cartTile[0])
    // // console.log("Ad No", add)
    // var removeItem = document.getElementsByClassName('remove-btn')
    // var deleteTile = removeItem.querySelector('adId')
    // console.log("Item to del", deleteTile)
    // var existingItems = JSON.parse(localStorage.getItem('cartitem'))
    // var cartId = JSON.parse(localStorage.getItem('cart-Id'))
    // var index
    // for (var i = 0; i < cartId.length; i++) {
    //     if(deleteTile == cartId[i]){
    //         index = i
    //     }
    // }


    
    // existingItems = existingItems.splice(index, 1)
    // cartId = cartId.splice(index, 1)
    // localStorage.setItem("cartitem", JSON.stringify(existingItems));
    // localStorage.setItem("cart-Id", JSON.stringify(cartId));
}
