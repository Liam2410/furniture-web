const checkAdminRole = function isAdminRole(req, res, next) {
	if(!req.user){
        return res.redirect('/login');
    }
	if (req.user.role == 'Admin'){
		return next();
	}

	return res.redirect('/Error/unauthorized-error');
}

module.exports = checkAdminRole;