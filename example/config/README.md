# MongoDB configuration
You need to change the config/database.js file to have actual IP address of MongoDB.
The default is localhost
```
// config/database.js
module.exports = {
    'url' : 'mongodb://localhost:27017' 
};
```
