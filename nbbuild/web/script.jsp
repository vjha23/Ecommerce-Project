<script>
    
    function add_to_cart(pid,pname,price)
    {
        let cart=localStorage.getItem("cart");
        if(cart===null)
        {
            // no cart yet
            let products=[];
            let product={prodID:pid,prodName:pname,prodQuantity:1,prodPrice:price};
            products.push(product);
            localStorage.setItem("cart",JSON.stringify(products));
             console.log("Product added for the first time");
        }else{
            // cart is already present
            let pcart=JSON.parse(cart);
            let oldproduct=pcart.find((items)=>item.prodId === this.pid)
            if(oldproduct)
            {
             // we have to increase the product
             oldproduct.prodQuantity=oldproduct.prodQuantity+1;
             pcart.map((items)=>{
                if(items.prodId===oldproduct.prodId){
                   items.prodQuantity=oldproduct.prodQuantity;
                }
             });
             localStorage.setItem("cart",JSON.stringify(pcart));
             console.log("product quantity is incresed");
            }else{
                // we have add the product
            let product={prodID:pid,prodName:pname,prodQuantity:1,prodPrice:price};
            products.push(product);
            localStorage.setItem(JSON.stringify(products)); 
            console.log("product is added");
            }
        }
    }

</script>