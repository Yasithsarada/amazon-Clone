const express = require('express')
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const adminAuth = require('./middleware/admin');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');

//Init
const PORT = 4000
const app = express();
const DB ="mongodb+srv://Yasith1999:Yasith1999%40@amazoncl.lkmoopr.mongodb.net/?retryWrites=true&w=majority";

//middleware

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

//connection
mongoose.connect(DB).then( ()=> {
    console.log("mongo DB connected");
}).catch((errr) =>{
    console.log(errr);
})



// app.get('/name', (req,res) => {
//     res.json({name :"Yasith"});
// })
app.listen(PORT ,() => {

    console.log(`server is running on port ${PORT}`);
});

