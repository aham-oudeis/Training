const express = require('express');
import fetch from 'node-fetch';
const app = express();
const port = 3000;
app.get('/', async (req, res) => {
    const response = await fetch('http://api.icndb.com/jokes/random')
    const json = await response.json();
    res.json(json);
})
app.listen(port);
module.exports = app;
