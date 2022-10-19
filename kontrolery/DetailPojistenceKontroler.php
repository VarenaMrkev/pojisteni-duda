<?php
class DetailPojistenceKontroler extends Kontroler
{
    public function zpracuj(array $parametry) : void
    {        
        $spravcePojistencu = new SpravcePojistencu();
        $spravcePojisteni = new SpravcePojisteni();
        //uloží informace do hlavčiky stránky
        $this->hlavicka = array(
            'titulek' => 'Detail pojištěnce',
            'klicova_slova' => 'pojištěnec, detail, pojištění',
            'popis' => 'Detail pojištěnce.'
        );
        //vyhledání pojištěnce v databází a uložení do proměné
        $pojistenec = $spravcePojistencu->vratPojistence($parametry[0]);
        //vyhledání adresy pojištěnce v databází a uložení do proměné
        $adresa = $spravcePojistencu->vratAdresu($pojistenec['adresa']);
        //vybere všechny pojištění, která má k sobě přiřazené pojištěnec
        $pojisteni = $spravcePojisteni->vratVsechnyProPojistence((int) $pojistenec['klient_id']);

        //zjištění zda bylo zmáčknuto tlačítko na odstranění pojištění a jeho případne odstranění
        if (!empty($parametry[1]) && $parametry[1] == 'odstran')
        {
            $spravcePojisteni->odstranPojisteni($parametry[2]);
            $this->pridejZpravu('Pojištění bylo úspěšně odstraněno');
            $this->presmeruj('detailPojistence/'.$pojistenec['klient_id']);
        }

        //předání dat pohledu
        $this->data['pojistenec'] = $pojistenec;
        $this->data['adresa'] = $adresa;
        $this->data['pojisteni']= $pojisteni;
        //nastavení pohledu
        $this->pohled = 'detailPojistence';
    }
}