import bookRoutes from "@/router/book";

const appRoutes = [
    {
        path: '/',
        component: () => import(/* webpackChunkName: "MainLayout" */ '@layouts/MainLayout.vue'),
        children: [
            {
                path: '',
                component: () => import(/* webpackChunkName: "HomePage" */ '@pages/HomePage.vue'),
            }
        ]
    }
]

const routes = [
    ...appRoutes,
    ...bookRoutes
]

export default routes