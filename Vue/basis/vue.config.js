const path = require('path');
module.exports = {
    devServer: {
        proxy: 'https://loripsum.net/'
    },
    configureWebpack: {
        resolve: {
            alias: {
                '@layouts': path.resolve(__dirname, 'src/Layouts'),
                '@pages': path.resolve(__dirname, 'src/Pages'),
                '@components': path.resolve(__dirname, 'src/components')
            }
        }
    }
}