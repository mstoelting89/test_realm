<?php

namespace App\Controller;

use App\Entity\Gericht;
use App\Form\GerichtType;
use App\Repository\GerichtRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/gericht', name: 'gericht.')]
class GerichtController extends AbstractController
{
    #[Route('/', name: 'bearbeiten')]
    public function index(GerichtRepository $gerichtRepository): Response
    {
        $gericht = $gerichtRepository->findAll();
        return $this->render('gericht/index.html.twig', [
            'gerichte' => $gericht,
        ]);
    }

    #[Route('/anlegen', name: 'anlegen')]
    public function anlegen(Request $request) {
        $gericht = new Gericht();
        $form = $this->createForm(GerichtType::class, $gericht);
        $form->handleRequest($request);



        if ($form->isSubmitted()) {
            //$bild = $request->files->get('gericht')['anhang'];
            $bild = $form->get('anhang')->getData();

            if ($bild) {
                $dateiname = md5(uniqid()) . '.' . $bild->guessClientExtension();
            }

            $bild->move(
                $this->getParameter('bilder_ordner'),
                $dateiname
            );
            $gericht->setBild($dateiname);

            //EntityManager
            $em = $this->getDoctrine()->getManager();
            $em->persist($gericht);
            $em->flush();

            return $this->redirect($this->generateURL("gericht.bearbeiten"));
        }


        //Response
        return $this->render('gericht/anlegen.html.twig', [
            'anlegenForm' => $form->createView(),
        ]);
    }

    #[Route('/entfernen/{id}', name: 'entfernen')]
    public function entfernen($id, GerichtRepository $gr) {
        //EntityManager
        $em = $this->getDoctrine()->getManager();
        $gericht = $gr->find($id);

        $em->remove($gericht);
        $em->flush();

        //Message
        $this->addFlash('erfolg', 'Gericht wurde erfolgreich entfernt');

        return $this->redirect($this->generateURL("gericht.bearbeiten"));
    }

    // Hier wird ein Gerichtobject übergeben, welches die ID bereits enthält (@paramconverter)
    #[Route('/anzeigen/{id}', name: 'anzeigen')]
    public function anzeigen(Gericht $gericht) {
        //dump($gericht); // quasi wie var_dump

        return $this->render('gericht/anzeigen.html.twig', [
            'gericht' => $gericht,
        ]);
    }
}
