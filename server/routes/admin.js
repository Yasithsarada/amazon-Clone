const express = require('express');
const adminAuth = require('../middleware/admin');
const Product = require('../model/product');
const adminRouter = express.Router();

//create admin middleware
adminRouter.post('/admin/add-product',adminAuth,async (req,res,next) =>{
    try {
        const {name,description,images,quantity,price, category} =req.body;
        let product = new Product({ 
            name, 
            description, 
            images, 
            quantity, 
            price,
            category
        }); 
        product = await product.save(); 
        res.json(product);
    } catch (error) {
        res.status(500).json({message: error.message});
    }
});

    adminRouter.get('/admin/get-products' ,a=adminAuth, async (req, res) => {
        try {
            const products = await Product.find({});
            res.json(products);
        } catch (error) {
            res.status(500).json({message: error.message});
        }
        
    }); 
    
    
    
    adminRouter.post('/admin/delete-product', adminAuth, async (req, res) =>{
        try {
            const {id} = req.body;
            let product =  await Product.findByIdAndDelete(id);
            res.json(product);
        } catch (error) {
            res.status(400).json({message: error.message});
        }
    });
module.exports = adminRouter;