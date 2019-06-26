var webpack = require('webpack');
var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin')
module.exports = {
    //devtool: 'eval-source-map',//配置生成Source Maps，开发中用于调试
    //页面入口文件配置
    entry:{
        "style":path.resolve(__dirname,'src/entry.style.js'),//只是为了生成css，取巧做法，应该根据需求每个页面require相关css模块
        "search":path.resolve(__dirname,'src/entry.search.js'),
        "category":path.resolve(__dirname,'src/entry.category.js'),
        "brand":path.resolve(__dirname,'src/entry.brand.js'),
        "msearch":path.resolve(__dirname,'src/entry.msearch.js'),
        "mcategory":path.resolve(__dirname,'src/entry.mcategory.js')
    },
    //入口文件输出配置
    //path.resolve(__dirname,'src/entry.js')，
    output: {
        filename: 'static/search2017/js/[name].bundle.js'
    },
    module: {
        //加载器配置
        loaders: [
            /*{ test: /\.js$/, loader: 'jsx-loader?harmony' }*/
            //{ test: /\.css$/, exclude: /\.useable\.css$/, loader: "style!css" },
             {test: /\.css$/,loader:  ExtractTextPlugin.extract("style-loader","css-loader")},
             { test: /\.js$/, loader: 'jsx-loader?harmony' } 
        ]
    },
    resolve: {
        //自动扩展文件后缀名，意味着我们require模块可以省略不写后缀名
        extensions: ['', '.js','.json','.css']
    },
    plugins:[
        //new webpack.optimize.CommonsChunkPlugin('vendor', 'scripts/vendor.[hash].js'), //公用文件
        new webpack.BannerPlugin("by."),//在这个数组中new一个就可以了
        new ExtractTextPlugin('static/search2017/css/style.min.css', {allChunks: true})
    ]
};