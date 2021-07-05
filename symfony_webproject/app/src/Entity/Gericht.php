<?php

namespace App\Entity;

use App\Repository\GerichtRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=GerichtRepository::class)
 */
class Gericht
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $beschreibung;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $preis;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $bild;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Kategorie", inversedBy="gericht")
     */
    private $kategorie;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getBeschreibung(): ?string
    {
        return $this->beschreibung;
    }

    public function setBeschreibung(?string $beschreibung): self
    {
        $this->beschreibung = $beschreibung;

        return $this;
    }

    public function getPreis(): ?float
    {
        return $this->preis;
    }

    public function setPreis(?float $preis): self
    {
        $this->preis = $preis;

        return $this;
    }

    public function getBild(): ?string
    {
        return $this->bild;
    }

    public function setBild(?string $bild): self
    {
        $this->bild = $bild;

        return $this;
    }

    public function getKategorie(): ?Kategorie
    {
        return $this->kategorie;
    }

    public function setKategorie(?Kategorie $kategorie): self
    {
        $this->kategorie = $kategorie;

        return $this;
    }
}
    