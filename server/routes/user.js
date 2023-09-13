const express = require('express');
const User = require('../model/user');
const { Product } = require('../model/product');
const auth = require('../middleware/auth');
const userRouter = express.Router();

//replaced
userRouter.post("/api/add-to-cart", auth, async (req, res) => {
    try {
      const { id } = req.body;
      console.log(id);
      console.log('kjjjjjj');
      
      const product = await Product.findById(id);
      if (!product) {
        console.log('that s yyyy');
      }
      console.log(product);
      let user = await User.findById(req.user);
      console.log(req.user);
      if (user.cart.length == 0) {
        user.cart.push({ product, quantity: 1 });
      } else {
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
        } else {
          user.cart.push({ product, quantity: 1 });
        }
      }
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
userRouter.delete("/api/remove-from-cart/:id", auth, async (req, res) => {
    try {
      const { id } = req.params;
      console.log(id);
      console.log('kjjjjjj');
      let user = await User.findById(req.user);
      const product = await Product.findById(id);
      if (!product) {
        console.log('that s yyyy');
      }
     
      if (user.cart.length == 0) {
        user.cart.push({ product, quantity: 1 });
      } else {
        for (let i = 0; i < user.cart.length; i++) {
          if (user.cart[i].product._id.equals(product._id)) {
            if (user.cart[i].quantity  == 1) {
              user.cart.splice(i,1); 
            }
            else{
              user.cart[i].quantity -= 1;
            }
          }
        }
  
    
      }
      user = await user.save();
      res.json(user);
    } catch (e) {
      console.log('this');
      res.status(500).json({ error: e.message });
    }
  });
module.exports = userRouter;