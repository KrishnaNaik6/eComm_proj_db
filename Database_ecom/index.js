const express = require('express')
const app = express();
const bodyParser = require('body-parser')


const { PrismaClient } = require('@prisma/client')
const prisma =new  PrismaClient()

const userRoute = require('./routes.user')
const sellerRoute = require('./routes.user')
const productRoute = require('./routes.user')
const wishlistRoute = require('./routes.user')
const cartRoute = require('./routes.user')
const orderRoute = require('./routes.user')
const paymentRoute = require('./routes.user')

app.use(bodyParser.json())

//using routes
app.use('/user', userRoute)
app.use('/seller', sellerRoute)
app.use('/product', productRoute)
app.use('/wishlist', wishlistRoute)
app.use('/cart', cartRoute)
app.use('/order', orderRoute)
app.use('/payment', paymentRoute)



app.listen(3000, ()=>{
    console.log("example app running on port 3000");
})

