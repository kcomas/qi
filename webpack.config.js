const { resolve } = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const SRC = resolve(__dirname, 'src');
const DIST = resolve(__dirname, 'dist');
const { NODE_ENV } = process.env;

const config = {
    entry: resolve(SRC, 'index.tsx'),
    output: {
        filename: 'bundle.js',
        path: DIST,
    },
    mode: NODE_ENV === 'production' ? 'production' : 'development',
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/,
            },
        ],
    },
    devtool: 'inline-source-map',
    resolve: {
        extensions: ['.tsx', '.ts', '.js'],
    },
    plugins: [new HtmlWebpackPlugin({ title: 'QI' })],
    devServer: {
        contentBase: DIST,
        compress: true,
        port: 8181,
    },
};

exports = { config };
module.exports = config;
