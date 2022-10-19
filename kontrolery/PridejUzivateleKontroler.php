<?php
class PridejUzivateleKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {
        // uložení informací do hlavičky stránky
        $this->hlavicka['titulek'] = 'Registrace';
        //zjištění zda byl odeslán formulář
        if ($_POST)
        {
            try
            {
                $spravceUzivatelu = new SpravceUzivatelu();
                // uložení dat z formláře do proměnné a následné uložení do dataváze, přesměrování na výpis uživatelů
                $spravceUzivatelu->registruj($_POST['jmeno'], $_POST['heslo'], $_POST['heslo_znovu']);
                $this->pridejZpravu('Uživatel byl úspěšně registrován.');
                $this->presmeruj('uzivatele');
            }
            catch (ChybaUzivatele $chyba)
            {
                $this->pridejZpravu($chyba->getMessage());
            }
        }
        // Nastavení pohledu
        $this->pohled = 'pridejUzivatele';
    }
}