<?php
class EditaceUzivateleKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {
        // nastavení hlavičky stránky
        $this->hlavicka['titulek'] = 'Editace uživatele';
        $spravceUzivatelu = new SpravceUzivatelu();

        // uložení uživatele do proměnné
        $editvanyUzivatel = $spravceUzivatelu->vratJednohoUzivatele( $parametry[0]);

        // zjištění zda byl odeslán formulář a případné uložení do proměnné
        if ($_POST)
        {
            try
            {
                $uzivatelKUlozeni = array('uzivatel_id' => $editvanyUzivatel['uzivatel_id'], 'jmeno' => $editvanyUzivatel['jmeno'],
                'heslo' => $editvanyUzivatel['heslo'], 'admin' => $editvanyUzivatel['admin']);
                // zjištění hodnot z formuláře a jejich případná změna v databázi
                if($_POST['admin'])
                {
                    if(strtoupper($_POST['admin']) == 'ANO'){
                        $uzivatelKUlozeni['admin'] = 1;
                        $spravceUzivatelu->zmenOpravneni($editvanyUzivatel['uzivatel_id'], $uzivatelKUlozeni);
                    }
                    if(strtoupper($_POST['admin']) == 'NE'){
                        $uzivatelKUlozeni['admin'] = 0;
                        $spravceUzivatelu->zmenOpravneni($uzivatelKUlozeni['uzivatel_id'], $uzivatelKUlozeni);
                    }
                }
                if($_POST['heslo'])
                {
                    if ($_POST['heslo'] != $_POST['hesloZnovu']) throw new ChybaUzivatele('Hesla nesouhlasí.');
                    $uzivatelKUlozeni['heslo'] = $spravceUzivatelu->vratOtisk($_POST['heslo']);
                    $spravceUzivatelu->zmenHeslo($uzivatelKUlozeni['uzivatel_id'], $uzivatelKUlozeni);
                }
                //přesměrování na výpis uživatelů
                $this->presmeruj('uzivatele');

            }
            catch (ChybaUzivatele $chyba)
            {
                $this->pridejZpravu($chyba->getMessage());
            }
        }
        //předání dat pohledu
        $this->data['editovanyUzivatel'] = $editvanyUzivatel;
        //nastavení pohledu
        $this->pohled = 'editaceUzivatele';
    }
}