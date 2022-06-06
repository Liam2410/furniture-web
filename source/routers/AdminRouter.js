const express = require('express');
const Product = require('../models/ProductModel');
const Order = require('../models/OrderModel');
const Account = require('../models/AccountModel');
const Router = express.Router();
const upload = require('../middlewares/UploadImage');
const Post = require('../models/PostModel');

//Trang dashboard
//req hay request là yêu cầu của client gửi đến
//res hay response là phản hồi của server đến client
Router.get('/', (req, res) => {
    res.render('admin/index');
})

//Trang hiển thị tất cả sản phẩm
Router.get('/all-product', async (req, res) => {
    var productList = await Product.getAllProduct();
    res.render('admin/all-product', {productList: productList});
})

//Trang thêm sản phẩm 
Router.get('/add-product', (req, res) => {
    return res.render('admin/add-product'); 
})

//Trang thêm sản phẩm post (nhận dữ liệu từ form)
Router.post('/add-product', upload.single('mainImage'), async (req, res) => {
    var productImage = req.file.filename;
    var productName = req.body.productName;
    var productType = req.body.productType;
    var productDescription = req.body.productDescription;
    var productPrice = req.body.productPrice;
    var productQuantity = req.body.productQuantity;

    var result = await Product.insertNewProduct(productName, productPrice, productQuantity, productType, productDescription, productImage);

    if(result){
        return res.redirect('/admin/all-product'); 
    }
    return res.redirect('/error/internal-server-error');
})

//Trang chi tiết sản phẩm
//req.query là lấy id dựa trên query của url
//Ví dụ /admin/detail-product?id=1 thì query là id=1 và req.query.id sẽ là 1
Router.get('/detail-product', async (req, res) => {

    if(!req.query.idProduct){
        return res.redirect('/error/not-found');
    }
    
    //Dữ liệu bình luận và đánh giá
    var idProduct = req.query.idProduct;
    var product = await Product.getProductById(idProduct);
    var commentRatingList = await Product.getCommentRatingByIDProduct(idProduct);
    var commentRatingCount = await Product.getRatingStarCountByIDProduct(idProduct);

    var fiveStarCount = commentRatingCount.fiveStar == null ? 0 : commentRatingCount.fiveStar;
    var fourStarCount = commentRatingCount.fourStar == null ? 0 : commentRatingCount.fourStar;
    var threeStarCount = commentRatingCount.threeStar == null ? 0 : commentRatingCount.threeStar;
    var twoStarCount = commentRatingCount.twoStar == null ? 0 : commentRatingCount.twoStar;
    var oneStarCount = commentRatingCount.oneStar == null ? 0 : commentRatingCount.oneStar;
    
    var countRating = fiveStarCount + fourStarCount + threeStarCount + twoStarCount + oneStarCount;
    var avarageRating = (5*fiveStarCount + 4*fourStarCount + 3*threeStarCount + 2*twoStarCount + 1*oneStarCount)/countRating;

    //Dữ liệu thống kê sản phẩm
    var totalPriceQuantity = await Product.getTotalPriceQuantityByIDProduct(idProduct);
    var countProductSale = await Product.getCountProductSaleByIDProduct(idProduct);
    var customerOrderList = await Product.getCustomerOrderSuccessByIDProduct(idProduct);
    var orderSuccessList = await Product.getAllOrderSuccessByIDProduct(idProduct);

    //Lưu ý commentRatingList là rút gọn của commentRatingList: commentRatingList
    return res.render('admin/detail-product', {product: product, commentRatingList, countRating, 
        fiveStarCount, fourStarCount, threeStarCount, twoStarCount, oneStarCount, avarageRating, totalPriceQuantity, 
        countProductSale, customerOrderList, orderSuccessList});
})

//Danh sách order
Router.get('/all-order', async (req, res) => {
    var orderList = await Order.getAllOrder();
    return res.render('admin/all-order', {orderList});
})

//Chi tiết order
Router.get('/detail-order', async (req, res) => {
    
    if(!req.query.idOrder || !req.query.idAccount){
        return res.redirect('/error/not-found');
    }

    var idOrder = req.query.idOrder;
    var idAccount = req.query.idAccount;

    var order = await Order.getOrderByID(idOrder);
    var account = await Account.getAccountByID(idAccount);
    var productOrderList = await Order.getOrderProductByIDOrder(idOrder);

    return res.render('admin/detail-order', {order, account, productOrderList});
})

//Thay đổi trạng thái của order
Router.get('/change-order-status', async (req, res) => {
    if(!req.query.idOrder|| !req.query.idAccount || !req.query.status){
        return res.redirect('/error/not-found');
    }

    var idOrder = req.query.idOrder;
    var idAccount = req.query.idAccount;
    var status = req.query.status;

    var updateResult = await Order.updateOrderStatusByIDOrder(idOrder, status);

    if(updateResult){
        return res.redirect(`/admin/detail-order?idOrder=${idOrder}&idAccount=${idAccount}`);
    }
    else{
        return res.redirect('/error/internal-server-error');
    }
})

//Thay đổi phí ship hàng
Router.post('/change-shipping-fee', async (req, res) => {
    if(!req.query.idOrder || !req.query.idAccount || !req.body.shippingFee){        
        return res.redirect('/error/not-found');
    }

    var idOrder = req.query.idOrder;
    var idAccount = req.query.idAccount;
    var shippingFee = req.body.shippingFee;

    var updateResult = await Order.updateShippingFeeByIDOrder(idOrder, shippingFee);

    if(updateResult){
        return res.redirect(`/admin/detail-order?idOrder=${idOrder}&idAccount=${idAccount}`);
    }
    else{
        return res.redirect('/error/internal-server-error');
    }
})

//Xóa đơn hàng
Router.get('/delete-order', async (req, res) => {
    if(!req.query.idOrder){        
        return res.redirect('/error/not-found');
    }

    var idOrder = req.query.idOrder;
    var deleteResult = await Order.deleteOrderByIDOrder(idOrder);

    if(deleteResult){
        return res.redirect(`/admin/all-order`);
    }
    else{
        return res.redirect('/error/internal-server-error');
    }
})

Router.get('/add-post', (req, res) => {
    return res.render('admin/add-post');
})

Router.post('/add-post', upload.single('postImage'), async (req, res) => {
    if( !req.body.postTitle || !req.body.postTag || !req.body.postDescription || !req.body.postContent ){
        return res.redirect('/error/not-found');
    }

    var postTitle = req.body.postTitle;
    var postTag = req.body.postTag;
    var postDescription = req.body.postDescription;
    var postContent = req.body.postContent;
    var postIdAuthor = 1;

    var postImage = req.file.filename;
    //image.filename

    if(!postImage){
        return res.redirect('/error/internal-server-error');
    }
    if(postImage){
        var insertResult = await Post.createNewPost(postTitle, postTag, postImage, postDescription, postContent, postIdAuthor);

        if(insertResult){
            return res.redirect('/admin/add-post');
        }
        else{
            return res.redirect('/error/internal-server-error');
        }
    }
})

Router.get('/all-post', async (req, res) => {
    var postList = await Post.getAllPost();
    return res.render('admin/all-post', {postList});
})

Router.get('/detail-post', async (req, res) => {
    if(!req.query.idPost){
        return res.redirect('/error/not-found');
    }
    var idPost = req.query.idPost;
    var post = await Post.getPostByID(idPost);

    return res.render('admin/detail-post', {post});
})


Router.post('/edit-post', upload.single('postImage'), async (req, res) => {
    if( !req.body.idPost || !req.body.postTitle || !req.body.postTag || !req.body.postDescription || !req.body.postContent ){
        return res.redirect('/error/not-found');
    }

    var postId = req.body.idPost;
    var postTitle = req.body.postTitle;
    var postTag = req.body.postTag;
    var postDescription = req.body.postDescription;
    var postContent = req.body.postContent;

    if(!req.file){
        var insertResultWithoutImage = await Post.updatePostWithoutImage(postId, postTitle, postTag, postDescription, postContent);

        if(insertResultWithoutImage){
            return res.redirect(`/admin/detail-post?idPost=${postId}`);
        }
        else{
            return res.redirect('/error/internal-server-error');
        }
    }
    else{
        var postImage = req.file.filename;

        if(!postImage){
            return res.redirect('/error/not-found');
        }
        else if(postImage){
            var insertResult = await Post.updatePost(postId, postTitle, postTag, postImage, postDescription, postContent);
    
            if(insertResult){
                return res.redirect(`/admin/detail-post?idPost=${postId}`);
            }
            else{
                return res.redirect('/error/internal-server-error');
            }
        }
    }

})

Router.get('/delete-post', async (req, res) => {
    if( !req.query.idPost ){
        return res.redirect('/error/not-found');
    }

    var idPost = req.query.idPost;
    var deleteResult = await Post.deletePostById(idPost);

    if(deleteResult){
        return res.redirect('/admin/all-post');
    }
    else{
        return res.redirect('/error/internal-server-error');
    }
})

Router.get('/all-customer', async (req, res) => {
    var customerList = await Account.getAllCustomer();
    return res.render('admin/all-customer', {customerList});
})

Router.get('/detail-customer', async (req, res) => {
    if( !req.query.idCustomer ){
        return res.redirect('/error/not-found');
    }

    var idCustomer = req.query.idCustomer;

    var account = await Account.getAccountByID(idCustomer);
    var commentRatingList = await Account.getAllCommentByIDAccount(idCustomer);
    var orderList = await Order.getAllOrderByIDAccount(idCustomer);

    var historyList = [];
    historyList.push({date: account.joinDate, data: account, type: 'account'})

    if(commentRatingList != null){
        commentRatingList.forEach(commentRating => {
            historyList.push({date: commentRating.commentDate, data: commentRating, type: 'comment'})
        });
    }
    if(orderList != null){
        orderList.forEach(order => {
            historyList.push({date: order.orderDate, data: order, type: 'order'})
        });
    }
    
    historyList.sort((firstElement, secondElement) => (firstElement.date > secondElement.date) ? -1 : 1)

    return res.render('admin/detail-customer', {account, orderList, commentRatingList, historyList});
})

module.exports = Router;