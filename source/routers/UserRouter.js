const express = require('express');
const Router = express.Router();
const Product = require('../models/ProductModel');
const Post = require('../models/PostModel');
const Cart = require('../models/CartModel');
const Order = require('../models/OrderModel');

//Trang chủ
Router.get('/', async (req, res) => {

    var idAccount = req.user.id;
    var cartNumber = await Cart.getNumberOfCartByIDAccount(idAccount);
    if(!cartNumber){
        cartNumber = 0;
    }
    else{
        cartNumber = cartNumber.SoLuong;
    }

    res.render('user/index', {cartNumber});
})

Router.get('/all-product', async (req, res) => {
    if(req.query.type){
        var productList = await Product.getAllProductByType(req.query.type);

        if(productList == null){
            return res.redirect('/error/not-found');
        }


        var idAccount = req.user.id;
        var cartNumber = await Cart.getNumberOfCartByIDAccount(idAccount);
        if(!cartNumber){
            cartNumber = 0;
        }
        else{
            cartNumber = cartNumber.SoLuong;
        }

        return res.render('user/all-product', {productList, cartNumber});
    }
    return res.redirect('/error/not-found');
})

Router.get('/detail-product', async (req, res) => {
    if(!req.query.idProduct){
        return res.redirect('/error/not-found');
    }

    var idAccount = req.user.id;
    var cartNumber = await Cart.getNumberOfCartByIDAccount(idAccount);
    if(!cartNumber){
        cartNumber = 0;
    }
    else{
        cartNumber = cartNumber.SoLuong;
    }

    var idProduct = req.query.idProduct
    var product = await Product.getProductById(idProduct);
    var type = product.type

    var relatedProductList = await Product.getAllRelatedProduct(idProduct, type);

    var commentRatingList = await Product.getCommentRatingByIDProduct(idProduct);
    var commentRatingCount = await Product.getRatingStarCountByIDProduct(idProduct);

    var fiveStarCount = commentRatingCount.fiveStar == null ? 0 : commentRatingCount.fiveStar;
    var fourStarCount = commentRatingCount.fourStar == null ? 0 : commentRatingCount.fourStar;
    var threeStarCount = commentRatingCount.threeStar == null ? 0 : commentRatingCount.threeStar;
    var twoStarCount = commentRatingCount.twoStar == null ? 0 : commentRatingCount.twoStar;
    var oneStarCount = commentRatingCount.oneStar == null ? 0 : commentRatingCount.oneStar;
    
    var countRating = fiveStarCount + fourStarCount + threeStarCount + twoStarCount + oneStarCount;
    var avarageRating = (5*fiveStarCount + 4*fourStarCount + 3*threeStarCount + 2*twoStarCount + 1*oneStarCount)/countRating;

    var checkBought = await Order.checkExistOrderUserProduct(idAccount, idProduct);

    return res.render('user/detail-product', {product, relatedProductList, commentRatingList, countRating, 
        fiveStarCount, fourStarCount, threeStarCount, twoStarCount, oneStarCount, avarageRating, cartNumber, checkBought});
})

Router.get('/cart', async (req, res) => {
    var idAccount = req.user.id;
    var cart = await Cart.getCartByIdAccount(idAccount);

    var cartNumber = await Cart.getNumberOfCartByIDAccount(idAccount);
    if(!cartNumber){
        cartNumber = 0;
    }
    else{
        cartNumber = cartNumber.SoLuong;
    }

    return res.render('user/cart', {cart, cartNumber});
})

Router.get('/add-quantity', async (req, res) => {
    if(!req.query.idProduct){
        return res.redirect('/error/not-found');
    }

    var idAccount = req.user.id;
    var idProduct = req.query.idProduct;
    var result = await Cart.addQuantityProductCart(idAccount, idProduct);

    if(result){
        return res.redirect('/user/cart');
    }
    return res.redirect('/error/internal-server-error');
})

Router.get('/minus-quantity', async (req, res) => {
    if(!req.query.idProduct){
        return res.redirect('/error/not-found');
    }

    var idAccount = req.user.id;
    var idProduct = req.query.idProduct;
    var result = await Cart.minusQuantityProductCart(idAccount, idProduct);

    if(result){
        return res.redirect('/user/cart');
    }
    return res.redirect('/error/internal-server-error');
})

Router.get('/remove-product-cart', async (req, res) => {
    if(!req.query.idProduct){
        return res.redirect('/error/not-found');
    }

    var idAccount = req.user.id;
    var idProduct = req.query.idProduct;
    var result = await Cart.deleteProductFromCart(idAccount, idProduct);

    if(result){
        return res.redirect('/user/cart');
    }
    return res.redirect('/error/internal-server-error');
})

Router.get('/add-to-cart', async (req, res) => {
    if (!req.query.idProduct){
        return res.redirect('/error/not-found');
    }

    var idAccount = req.user.id;
    var idProduct = req.query.idProduct;
    var quantityProduct = 1;

    var resultAddQuantity = await Cart.addQuantityProductCart(idAccount, idProduct);

    if(!resultAddQuantity){
        var result = await Cart.addProductToCart(idAccount, idProduct, quantityProduct);
        if(result){
            return res.redirect('/user/cart');
        }
        return res.redirect('/error/internal-server-error');
    }
    return res.redirect('/user/cart');
})

Router.post('/add-comment-rating', async (req, res) => {
    if(!req.body.idProduct || !req.body.ratingPoint || req.body.ratingPoint == 0){
        return res.redirect('/error/not-found');
    }

    var idAccount = req.user.id;
    var idProduct = req.body.idProduct;
    var ratingPoint = req.body.ratingPoint;
    var commentContent = req.body.commentContent;

    var result = Product.addCommentRatingToProduct(idAccount, idProduct, commentContent, ratingPoint);

    if(result){
        return res.redirect("/user/detail-product?idProduct="+idProduct);
    }

    return res.redirect('/error/internal-server-error');
})

Router.post('/cart', async (req, res) => {
    var idAccount = req.user.id;
    var receiverName = req.body.receiverName;
    var receiverPhone = req.body.receiverPhone;
    var email = req.body.email;
    var shippingAddress = req.body.shippingAddress;
    var totalPrice = req.body.totalPrice;
    var note = req.body.note;

    var resultAddNewOrder = await Order.addNewOrder(idAccount, note, shippingAddress, totalPrice);
    var newestInsertOrder = await Order.getNewestOrderByIDAccount(idAccount);
    var idOrder = newestInsertOrder.idOrder;

    //Lấy sản phẩm trong cart
    var cart = await Cart.getCartByIdAccount(idAccount);

    cart.forEach(async product => {
        
        productPrice = 99999999;
        if(product.salePercent != null){
            productPrice = product.price*(1 - (product.salePercent/100)) * product.quantityProduct;
        }
        else{
            productPrice = product.price * product.quantityProduct;
        }

        var idProduct = product.id;
        var quantityProduct = product.quantityProduct;
        var resultAddNewOrderProduct = await Order.addNewOrderProduct(idOrder, idProduct, productPrice, quantityProduct);
    });

    var resultDeleteCart = await Cart.deleteCartByIdAccount(idAccount);
    return res.redirect('/user/cart');
})

Router.get('/all-post', async (req, res) => {
    var postList = await Post.getAllPost();

    var idAccount = req.user.id;
    var cartNumber = await Cart.getNumberOfCartByIDAccount(idAccount);
    if(!cartNumber){
        cartNumber = 0;
    }
    else{
        cartNumber = cartNumber.SoLuong;
    }

    return res.render('user/all-post', {postList, cartNumber});
})

Router.get('/detail-post', async (req, res) => {
    if(!req.query.idPost){
        return res.redirect('/error/not-found');
    }

    var idPost = req.query.idPost;
    var post = await Post.getPostByID(idPost);

    var idAccount = req.user.id;
    var cartNumber = await Cart.getNumberOfCartByIDAccount(idAccount);
    if(!cartNumber){
        cartNumber = 0;
    }
    else{
        cartNumber = cartNumber.SoLuong;
    }
    
    return res.render('user/detail-post', {post, cartNumber});
})

Router.get('/contact', async (req, res) => {
    var idAccount = req.user.id;

    var cartNumber = await Cart.getNumberOfCartByIDAccount(idAccount);
    if(!cartNumber){
        cartNumber = 0;
    }
    else{
        cartNumber = cartNumber.SoLuong;
    }

    return res.render('user/contact', {cartNumber});
})


Router.get('/order', async (req, res) => {
    var idAccount = req.user.id;
    var orderList = await Order.getOrderOfUser(idAccount);

    var cartNumber = await Cart.getNumberOfCartByIDAccount(idAccount);
    if(!cartNumber){
        cartNumber = 0;
    }
    else{
        cartNumber = cartNumber.SoLuong;
    }

    return res.render('user/order', {orderList, cartNumber});
})


module.exports = Router;