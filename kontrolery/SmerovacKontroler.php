<?php

class SmerovacKontroler extends Kontroler
{
    protected Kontroler $kontroler;
    /** 
     * funkce rozdělí url na jednotlivé parametry
    */
    private function parsujURL(string $url) : array
    {
        $naparsovanaURL = parse_url($url);
        $naparsovanaURL["path"] = ltrim($naparsovanaURL["path"], "/");
        $naparsovanaURL["path"] = trim($naparsovanaURL["path"]);
        $rozdelenaCesta = explode("/", $naparsovanaURL["path"]);
        return $rozdelenaCesta;
    }
    /**
     * funkce změní zpis pomlčkové notace do velbloudí 
     */
    private function pomlckyDoVelbloudiNotace(string $text) : string
    {
        $veta = str_replace('-', ' ', $text);
        $veta = ucwords($veta);
        $veta = str_replace(' ', '', $veta);
        return $veta;
    }

    public function zpracuj(array $parametry) : void
    {
        //uložení rozdělené url do proměnné
        $naparsovanaURL = $this->parsujURL($parametry[0]);
        //ověření zda byla v parametrech zadán konkrétní pohled, pokud ne přesměrování na přihlášení
        if(empty($naparsovanaURL[0]))
        {
            $this->presmeruj('prihlaseni');
        }
        //zjištění kontroleru z pohledu
        $tridaKontroleru = $this->pomlckyDoVelbloudiNotace(array_shift($naparsovanaURL)).'Kontroler';
        if (file_exists('kontrolery/'.$tridaKontroleru.'.php'))
            $this->kontroler = new $tridaKontroleru;
        else
        $this->presmeruj('chyba');
        
        // volání controlleru
        $this->kontroler->zpracuj($naparsovanaURL);
		
		// vastavení proměnných pro pohled
		$this->data['titulek'] = $this->kontroler->hlavicka['titulek'];
		$this->data['popis'] = $this->kontroler->hlavicka['popis'];
		$this->data['klicova_slova'] = $this->kontroler->hlavicka['klicova_slova'];

        $uzivatel = new SpravceUzivatelu();
        $prihlasenyUzivatel = $uzivatel->vratUzivatele();
		
		// nastavení hlavního pohledu
		$this->pohled = 'rozlozeni';
        $this->data['zpravy'] = $this->vratZpravy();
        $this->data['prihlasenyUzivatel'] = $prihlasenyUzivatel;
    }
}