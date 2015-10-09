var webpack = require('webpack')
var ExtractTextPlugin = require("extract-text-webpack-plugin")

var config = {
    // configuration
    context: __dirname,
    entry: {
        base: "./src/base",
        main: "./src/main.coffee",
    },
    devtool: "#source-map",
    output: {
        path: __dirname + "/dist",
        filename: "[name].bundle.js",
        chunkFilename: "[id].bundle.js"
    },
    module:{
        loaders:[
            {   test: /\.js$/,
                exclude: /(node_modules|bower_components)/,
                loader:"babel-loader",
            },
            { test: /\.coffee$/, loader:"coffee-loader" },
            { test: /\.less$/,
                loader:ExtractTextPlugin.extract("style-loader", "css-loader!less-loader")
            },
        ]
    },
    plugins: [
        new ExtractTextPlugin("[name].css", {allChunks:true}),
    ]
};

module.exports = config;
