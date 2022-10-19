<?php
class EditacePojisteniKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {
        // uložení informací do hlavičky stránky
        $this->hlavicka['titulek'] = 'Editace pojištění';
        $spravcePojisteni = new SpravcePojisteni();
        $spravcePojistencu = new SpravcePojistencu();

        // uložení pojištěnce do proměnné
        $pojistenec = $spravcePojistencu->vratPojistence($parametry[0]);
        // příprava prázdného pojištění
        $pojisteni = array(
            'pojisteni_id' => '',
            'typ' => '',
            'pojistne' => '',
            'pojistenec' => '',
            'vznik' => '',
            'platnost' => '',
        );
        // zjištění zda byl odeslán formulář, a jeho případné uložení do proměnné
        if ($_POST)
        {
            $pojisteni = array(
                'pojisteni_id' => (int) $_POST['pojisteni_id'],
                'typ' => $_POST['typ'],
                'pojistne' => $_POST['pojistne'],
                'pojistenec' => $pojistenec['klient_id'],
                'vznik' => $_POST['vznik'],
                'platnost' => $_POST['platnost'],
            );

            // uložení pojištěnce do DB a následné přesměrování na detail o pojištěnci
            $spravcePojisteni->ulozPojisteni($pojisteni['pojisteni_id'], $pojisteni);
            $this->pridejZpravu('Pojištění bylo úspěšně uloženo.');
            $this->presmeruj('detailPojistence/'.$pojistenec['klient_id']);
        }

        /* zjištění zda je zadané id pojištění k editaci a případné zapsaní jeho informací do 
        proměnných sloužících pro předání infromací pohledu*/
        else if (!empty($parametry[1]))
        {
            $pojisteni = $spravcePojisteni->vratPojisteni($parametry[1]);
        }

        //předání dat pohledu
        $this->data['pojistenec'] = $pojistenec;
        $this->data['pojisteni'] = $pojisteni;

        //nastavení pohledu
        $this->pohled = 'editacePojisteni';
    }
}