import bookRoutes from "@/router/book";

const appRoutes = [
    {
        path: '/',
        component: () => import('@layouts/MainLayout.vue'),
        children: [
            {
                path: '',
                component: () => import('@pages/HomePage.vue'),
            }
        ]
    }
]

const routes = [
    ...appRoutes,
    ...bookRoutes
]

export default routes