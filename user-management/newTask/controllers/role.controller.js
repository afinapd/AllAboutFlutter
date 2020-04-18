const getAllRoles = async (req, res, service) => {
    try {
        let role;
        if (req.query.id) {
            const id = req.query.id;
            role = await service.getRoleById(id)
        } else if (req.query.pageNo && req.query.rowPage) {
            role = await service.getAllProductPaging(req.query.pageNo, req.query.rowPage);
        } else {
            role = await service.getAllRoles();
        }
        res.send(role);
    } catch (e) {
        res.sendStatus(500);
    }

};


module.exports = {getAllRoles}
