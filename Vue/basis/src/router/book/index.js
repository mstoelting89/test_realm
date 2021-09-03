const bookRoutes = [
    {
        path: '/book',
        component: () => import(/* webpackChunkName: "MainLayout" */ '@layouts/MainLayout.vue'),
        children: [
            {
                path: '',
                component: () => import(/* webpackChunkName: "BookList" */ '@pages/book/BookList.vue')
            }
        ]
    }
]

export default bookRoutes