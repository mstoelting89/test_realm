<?php

namespace App\Form;

use App\Entity\Gericht;
use App\Entity\Kategorie;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\SubmitButton;
use Symfony\Component\OptionsResolver\OptionsResolver;

class GerichtType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('anhang', FileType::class, ['mapped' => false])
            ->add('beschreibung')
            ->add('kategorie', EntityType::class, [
                'class'=>Kategorie::class
            ])
            ->add('preis')
            ->add('speichern', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Gericht::class,
        ]);
    }
}
