<?php
class UzivateleKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {
        $paginace = new Paginace();
        $spravceUzivatelu = new SpravceUzivatelu(); 
        // uložení informací do hlavičky stránky
        $this->hlavicka = array(
            'titulek' => 'Uživatelé',
            'klicova_slova' => 'uživatelé, seznam, výpis',
            'popis' => 'Výpis uživatelů.'
        );
         //zjištění zda nebylo zadáno odstranění uzivatele, jeho případné odstranění
        if (!empty($parametry[0]) && $parametry[0] == 'odstran')
        {
            $spravceUzivatelu->odstranUzivatele($parametry[1]);
            $this->pridejZpravu('Uživatel byl úspěšně odstraněn');
            $this->presmeruj('uzivatele');
        }
        //zjišění na které straně výpisu se nacházíme v případě, že nic není zadáno nastaví se první strana
        if (isset($_GET['strana']))
            $strana = $_GET['strana'];
        else
            $strana = 1;
        //stanovení počtu záznamů na jednu stranu   
        $naStranu = 10;
        //vrátí počet záznamů celkem
        $pocetZaznamu = $spravceUzivatelu->vratPocet();
        //vypočítání počtu stran
        $stran = ceil($pocetZaznamu[0] / $naStranu);
        //získání všech uživatelů z databáze a jejich uložení do proměnné
        $uzivatele = $spravceUzivatelu->vratVsechny($strana, $naStranu);
        //předání dat pohledu
        $this->data['strankovani'] = array($paginace, $strana, $stran);
        $this->data['uzivatele'] = $uzivatele;
        //nastavení pohledu
        $this->pohled = 'uzivatele';
    }
}