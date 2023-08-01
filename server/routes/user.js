const express = require('express');
const User = require('../model/user');
const userRouter = express.Router();


userRouter.get('/api/deal-of-the-day', auth ,async (req, res) => {   

    try {
        const {id } = req.body;
        const product = await Product.findById(id);
        let user = await User.findById(req.user);


        if (user.cart.length == 0) {
            user.cart.push({product,quantity});
        }else{
            let isProductFound = false;
            for (let i = 0; i < user.cart.length; i++) {
                if (user.cart[i].product._id.equals(product._id)) {
                    isProductFound = true;
                }
                    
                }                
                if (isProductFound) {
                    let producttt = user.cart.find((productt) => 
                    productt.product._id.equals(product._id)
                    );
                producttt.quantity += 1;  
                }else{
                    user.cart.push({product , quantity : 1});
                }
            }
            user = await user.save();
            res.json(user);
        
    } catch (error) {
        res.status(400).json({message: error.message});
    }
});
module.exports = userRouter;