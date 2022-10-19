<?php
class PrihlaseniKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {
        $spravceUzivatelu = new SpravceUzivatelu();
        // uložení informací do hlavičky stránky
        $this->hlavicka['titulek'] = 'Přihlášení'; 
        //zjištění zda byl vyplněn formulář
        if ($_POST)
        {
            try
            {
                //ověření spránosti přihlašovacích údajů
                $spravceUzivatelu->prihlas($_POST['jmeno'], $_POST['heslo']);
                $this->pridejZpravu('Byl jste úspěšně přihlášen.');
                $this->presmeruj('pojistenci');
            }
            catch (ChybaUzivatele $chyba)
            {
                $this->pridejZpravu($chyba->getMessage());
            }
        }
        //nastavení pohledu
        $this->pohled = 'prihlaseni';
    }
}