const userAuthentication = async (req, res, service) => {
    try {
        const user = req.body;
        const userInfo = await service.authenticate(user);
        if (userInfo) {
            res.send(userInfo);
        } else {
            res.sendStatus(401);
        }
    } catch (e) {
        res.sendStatus(500);
    }

};
module.exports = {
    userAuthentication
};