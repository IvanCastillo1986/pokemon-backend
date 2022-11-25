// We put this into the models folder because models have to do with data, and we are validating incoming data

const validateUrl = (req, res, next) => {
    next()
};

module.exports = { validateUrl };