const express = require('express');
const Product = require('../model/product');
const auth = require('../middleware/auth');
const productRouter = express.Router();

productRouter.get('/api/products',auth,async (req,res)  => {
    try {
        console.log('it s heee');
        console.log(req.query.category);

        const products = await Product.find({category : req.query.category});
        res.json(products);
    } catch (error) {
        res.status(400).json({message: error.message});
    }
});

productRouter.get('/api/products/search/:name' ,auth ,async (req, res) => {
    try {
        const products = await Product.find({
            name : {$regex : req.params.name,$options: 'i'}});
            res.json(products);
        } 
    catch (error) {
     res.status(400).json({message: error.message});
 }
});


productRouter.post('/api/rate-product', auth ,async (req, res) => {
 
    try {
        const {id , rating} = req.body;
        // console.log('it s ratinggg');
        // console.log(rating);
        // console.log(id);
        let product = await Product.findById(id);

        // if (product){
        //     console.log('product found');
        // }
        // for (let i = 0; i < product.ratings.length; i++) {
        //     if(product.ratings[i].userId == req.user){
        //         product.ratings.splice(i,1);
        //         console.log(user);
        //         break;
        //     }
            
        // }
        
        // const ratingSchema = {
        //     userId : req.uesr,
        //     rating 
        // }
        // product.ratings.push(ratingSchema);
        // product = await product.save();
        // console.log(product);
        // res.json(product);

        for (let i = 0; i < product.ratings.length; i++) {
            if (product.ratings[i].userId == req.user) {
              product.ratings.splice(i, 1);
              break;
            }
          }
          
        console.log(req.user);

          const ratingSchema = {
            userId: req.user,
            rating,
          };
      
          product.ratings.push(ratingSchema);
          product = await product.save();
          res.json(product);
    } catch (error) {
        res.status(400).json({message: error.message});
    }
})


productRouter.get('/api/deal-of-the-day', auth ,async (req, res) => {   

    try {
        console.log("called");
        // let highestRating = 0;
        // let highestRatedProduct = 0;
        let products = await Product.find({});
        console.log("products[0]");
        
        // for (let i = 0; i < products.length; i++) {
            //     for (var i = 0; i < products.ratings.length; i++) {
                //         totalRating += products.ratings[i].rating;
                
                //         if (totalRating != 0) {
                    //           avgRating = totalRating / products.ratings.length;
                    //           log("avgRating");
                    //           log(avgRating);
                    //         }
                    //       }
                    
                    // if (avgRating > highestRating) {
                        //     highestRating = avgRating;
                        //     highestRatedProduct = products[i];
                        // }
                        
                        // }
                        
        products = products.sort((a,b) => {
            let aSum = 0;            
            let bSum = 0;            
        
        for (let i = 0; i < a.ratings.length; i++) {
            aSum += a.ratings[i].rating;
        }
        for (let i = 0; i < b.ratings.length; i++) {
            bSum += b.ratings[i].rating;
        }

        return aSum < bSum ? 1 : -1;
        });

    console.log(products[0]);
    res.json(products[0]);
    } catch (error) {
        res.status(400).json({message: error.message});
    }
});

module.exports = productRouter;
