<?php
class PojisteniKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {
        $paginace = new Paginace();
        $spravcePojistencu = new SpravcePojistencu();
        $spravcePojisteni = new SpravcePojisteni();
        $spravceUzivatelu = new SpravceUzivatelu();
        
        //zjištění zda je příhlášen uživatel, pokud ne jeho přesměrování na přihlášení
        if(!$prihlasenyUzivatel) $this->presmeruj('prihlaseni');
        //uložení přihlášeného uživatele do proměnné
        $prihlasenyUzivatel = $spravceUzivatelu->vratUzivatele();
        // uložení informací do hlavičky stránky
        $this->hlavicka = array(
            'titulek' => 'Pojištění',
            'klicova_slova' => 'pojištění, seznam, výpis',
            'popis' => 'Výpis pojištění.'
        );
         //zjištění zda nebylo zadáno odstranění pojištění, jeho případné odstranění
        if (!empty($parametry[0]) && $parametry[0] == 'odstran')
        {
            $spravcePojisteni->odstranPojisteni($parametry[1]);
            $this->pridejZpravu('Pojištění bylo úspěšně odstraněno');
            $this->presmeruj();
        }
        //zjišění na které straně výpisu se nacházíme v případě, že nic není zadáno nastaví se první strana
        if (isset($_GET['strana']))
            $strana = $_GET['strana'];
        else
            $strana = 1;
        //stanovení počtu záznamů na jednu stranu
        $naStranu = 10;
        //vrátí počet záznamů celkem
        $pocetZaznamu = $spravcePojistencu->vratPocet();
        //vypočítání počtu stran
        $stran = ceil($pocetZaznamu[0] / $naStranu);
        //získání všech pojištění z databáze a jejich uložení do proměnné
        $pojisteni = $spravcePojisteni->vratVsechnyPojisteni($strana, $naStranu);

        //předání dat pohledu
        $this->data['strankovani'] = array($paginace, $strana, $stran);
        $this->data['pojisteni'] = $pojisteni;
        $this->data['prihlasenyUzivatel'] = $prihlasenyUzivatel;
        //nastavení pohledu
        $this->pohled = 'pojisteni';
    }
}