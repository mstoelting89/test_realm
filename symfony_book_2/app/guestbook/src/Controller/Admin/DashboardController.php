<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use App\Entity\Conference;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\CrudUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {

        return parent::index();
        //$url = $routeBuilder->setController(ConferenceCrudController::class)->generateUrl();
        //return $this->redirect($url);

        // http://guestbook.local:8080/admin?crudAction=index&crudControllerFqcn=App%5CController%5CAdmin%5CConferenceCrudController&menuIndex=1&signature=Id6eP_gb5vOD69gXJXR57PqqRQgAwGZbAlDbXZ4lOJw&submenuIndex=-1
        // http://guestbook.local:8080/admin?crudAction=index&crudId=a7e285e&signature=W6i54nqGG3icVHojt6K0KSLRB35j1YFG0xkJmlRVhog
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Guestbook');
    }

    public function configureMenuItems(): iterable
    {
        //yield MenuItem::linktoDashboard('Dashboard', 'fa fa-home');
        // yield MenuItem::linkToCrud('The Label', 'fas fa-list', EntityClass::class);
        yield MenuItem::linkToRoute('Back to Website', 'fas fa-home', 'homepage');
        yield MenuItem::linkToCrud('Conferences', 'fas fa-map-marker-alt', Conference::class);
        yield MenuItem::linkToCrud('Comments', 'fas fa-comments', Comment::class);
    }
}
