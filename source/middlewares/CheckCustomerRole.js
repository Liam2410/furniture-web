const checkCustomerRole = function isCustomerRole(req, res, next) {
	if(!req.user){
        return res.redirect('/login');
    }
	if (req.user.role == 'Customer'){
		return next();
	}

	return res.redirect('/Error/unauthorized-error');
}

module.exports = checkCustomerRole;