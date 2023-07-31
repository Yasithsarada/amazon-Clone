const jwt = require('jsonwebtoken');
const User = require('../model/user');

const adminAuth = async (req, res, next) => {
    try {
      const token = req.header("X-auth-token");
  
      if (!token) {
        return res
          .status(401)
          .json({ msg: "access denied..token not available" });
      }
      const verified = jwt.verify(token, "passwordKey");
  
      if (!verified) {
        return res.status(401).json({ msg: "access denied..token not verified" });
      }

      const user = await User.findById(verified.id);
      if (user.type == 'user' || user.type == 'seller') {
        return res
        .status(401)
        .json({ msg: "access denied..not an admin" });
      }
      console.log("workinkg admin middleware");
      req.use = verified.id;
      req.token = token; 
      next();
    } catch (error) {
      res.status(500).json({error : error});
    }
  };
  module.exports = adminAuth;