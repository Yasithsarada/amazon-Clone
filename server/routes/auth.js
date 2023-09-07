const express = require('express');
const User = require('../model/user');
const authRouter = express.Router();
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');

// sign up
authRouter.post('/api/signup', async(req ,res) => {
   
    try {
        const {name,email,password} = req.body; 
    
        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(400).json({msg: "user already exist with same email"});
        }


        const hashedPassword = await bcryptjs.hash(password , 8);


        let user = new User({
            name,
            email,
            password : hashedPassword, 
        });
    
        const userSaved = await user.save(user);
        res.json({user : userSaved});
        
    } catch (error) {
        res.status(404).json({msg:error.message});
    }
})
//sign in


authRouter.post('/api/signin',async (req,res) => {
    
    console.log('sign in working......');
try {
    const {email , password} = req.body;
    const user = await User.findOne({email});
    console.log(user);
    
    if(!user){
        console.log('nooo');
        return res.status(400).json({msg : "User doesn't exist with the entered email"});
    }
    const isMatch = await bcryptjs.compare(password , user.password);
    console.log(isMatch);

    
// console.log(isMatch);
    if(!isMatch){
        return res.status(400).json({msg : "Invalid password"});
    }


    
    
    const token =  jwt.sign({id : user._id} , "passwordKey"); //generate token using id(user._id) and secret key
    console.log(token);
   
    res.json({token,...user._doc});
    console.log(user._doc);
     // Overall, this code generates a JWT based on the user's ID and a secret key, and sends it back to the client along with additional user information in a JSON response. The client can then use this token for authentication or authorization purposes in subsequent requests.
    // console.log(p);
    // console.log(res.body);
} catch (error) {
    console.log("check thisssssssssssssssssssssssssssssssssss");
    res.status(400).json({error : error.message});
}
});



authRouter.post('/tokenIsValid', async(req, res) => {

   try {
    console.log('i ve called');
     const token = req.header('X-auth-token');
     console.log('token is received -get');
     if(!token) return res.json(false);
     
     const verified = jwt.verify(token ,"passwordKey" );
     console.log('token verified - get');
     if (!verified) return res.json(false);
     
     const user = await User.findById(verified.id);
     if (!user) return res.json(false);


     res.json(true);
   } catch (error) {
    console.log("check thisss tokenIsValid");
    res.status(400).json({error : error.message});
   }
    
});

authRouter.get('/',auth,async (req , res) => {
    console.log("working get api route");
    const user = await User.findById(req.user);
    console.log(user.name);
    res.json({...user._doc , token : req.token});
    // console.log(req.user);
    // console.log(req);
});
module.exports = authRouter;