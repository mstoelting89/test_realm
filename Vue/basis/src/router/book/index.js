const bookRoutes = [
    {
        path: '/book',
        component: () => import('@layouts/MainLayout.vue'),
        children: [
            {
                path: '',
                component: () => import('@pages/book/BookList.vue')
            }
        ]
    }
]

export default bookRoutes