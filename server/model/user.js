const mongoose = require('mongoose');
const { ProductSchema } = require('./product');


const userSchema = mongoose.Schema({
    name : {
        required : true,
        trim: true,
        type : String
    },
    email : {
        required : true,
        type : String,
        trim: true,
        validate : {
            validator : (value) => {
                const re =  /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return value.match(re);
            },
            message : "please enter valid email"
        },
    },
    password : {
        required : true,
        type : String
    },
    address : {
        default : "", 
        type : String
    },
    type : {
        default : "user",
        type : String
    },
    cart : {
        product : ProductSchema,
        quantity : {
            type : Number,
            required: true
        }
    }
})

const User = mongoose.model('User' ,  userSchema);
module.exports = User; 