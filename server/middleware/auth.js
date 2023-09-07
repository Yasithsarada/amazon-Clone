const jwt = require('jsonwebtoken');

const auth = async (req ,res ,next) => {
    try {
        console.log("workinkg middleware");
        const token = req.header('X-auth-token');
        
        if(!token){
            res.status(401).json({msg : 'no token...access denied'});
        }

        const verified = await jwt.verify(token, 'passwordKey');
        if(!verified) return res.status(401).json({msg : 'token verification failed'});

        req.user = verified.id;
        req.token = token;
        req.mynm = 'yasith';    
        // console.log(verified);
        // console.log(user);
        next();
    } catch (error) {
        res.status(500).json({error : error});
    }

}





module.exports = auth;