// We put this into the models folder because models have to do with data, and we are validating incoming data

const validateUrl = (req, res, next) => {
    console.log('This url is being validated by validateUrl() function');
    // console.log('req.protocol:', req.protocol);
    // console.log('req.url:', req.url);
    // console.log('req hostname:', req.hostname);
    console.log('req.body.url:', req.body.url);
    // console.log('req.originalUrl:', req.originalUrl);

    if (req.hostname === 'localhost:3333' && req.originalUrl === '/users') {
        next();
    } else {
        res.status(400).send('Invalid url. Please check your url and try again');
    }
};

module.exports = { validateUrl };