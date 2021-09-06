<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class MailerController extends AbstractController
{
    #[Route('/mail', name: 'mail')]
    public function sendEmail(MailerInterface $mailer): Response
    {
        $email = (new Email())
        ->from('tisch1@menukarte.wip')
        ->to('kellner@menuarte.wip')
        ->subject('Bestellung')
        ->text('extra Pommes');

        $mailer->send($email);

        return new Response('Email versendet');
    }
}
