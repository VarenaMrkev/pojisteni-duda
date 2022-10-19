<?php
class EditacePojistenceKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {
        // nastavení hlavičky stránky
        $this->hlavicka['titulek'] = 'Editace pojištěnce';
        $spravcePojistencu = new SpravcePojistencu();
        // příprava prázdného pojištěnce a adresy
        $pojistenec = array(
            'klient_id' => '',
            'jmeno' => '',
            'prijmeni' => '',
            'telefon' => '',
            'email' => '',
            'adresa' => '',
        );
        $adresa = array(
            'ulice' => '',
            'cislo_popisne' => '',
            'mesto' => '',
            'PSC' => '',
        );
        // zjištění zda byl odeslán formulář a jeho případné uložení do proměných pojištěnec a adresa
        if ($_POST)
        {
            $pojistenec = array(
                'klient_id' => (int) $_POST['klient_id'],
                'jmeno' => $_POST['jmeno'],
                'prijmeni' => $_POST['prijmeni'],
                'telefon' => $_POST['telefon'],
                'email' => $_POST['email'],
            );
            $adresa = array(
                'ulice' => $_POST['ulice'],
                'cislo_popisne' => $_POST['cislo_popisne'],
                'mesto' => $_POST['mesto'],
                'PSC' => $_POST['PSC'],
            );
            
            /*zjištění zda zadaná adresa je již v databázi, pokud ano přiřadí pojištěnci její Id, 
            pokude uloží ji do databáze a přiřadí Id nově vznikle datbáze pojištěnci*/
            if($spravcePojistencu->zdaExistuje($adresa)[0]){
                $pojistenec['adresa'] = (int) $spravcePojistencu->zjistiAdresu($adresa)[0];
            }
            else{
                $pojistenec['adresa'] = $spravcePojistencu->ulozAdresu($adresa);
            }

            // uložení pojištěnce do DB
            $spravcePojistencu->ulozPojistence($pojistenec['klient_id'], $pojistenec);
            $this->pridejZpravu('Pojištěnec byl úspěšně uložen.');
            $this->presmeruj('pojistenci');
        }
        /* zjištění zda je zadané id pojištěnce k editaci a případné zapsaní jeho informací do 
        proměnných sloužících pro předání infromací pohledu*/
        else if (!empty($parametry[0]))
        {
            $pojistenec = $spravcePojistencu->vratPojistence($parametry[0]);
            $adresa = $spravcePojistencu->vratAdresu($pojistenec['adresa']);
        }

        //předání dat pohledu
        $this->data['pojistenec'] = $pojistenec;
        $this->data['adresa'] = $adresa;
        //nastavení pohledu
        $this->pohled = 'editacePojistence';
    }
}