<?php
class ChybaKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {
    // uložení informací do hlavičky stránky
    header("HTTP/1.0 404 Not Found");
    // Hlavička stránky
    $this->hlavicka['titulek'] = 'Chyba 404';
    // nastavení pohledu
    $this->pohled = 'chyba';
    }
}