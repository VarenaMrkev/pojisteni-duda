<?php
abstract class Kontroler
{
    //proměná pro předávání dat pohledům
    protected array $data = array(); 
    //proměnná pro ukládání pohledu   
    protected string $pohled = "";
    //proměnná pro ukládání dat to hlavičky stránky
    protected array $hlavicka = array('titulek' => '', 'klicova_slova' => '', 'popis' => '');
    /** 
     * zpracuje parametry předané kontroleru
     */
    abstract function zpracuj(array $parametry) : void;
    /**
     * funkce pro vypsání pohledu
     */
    public function vypisPohled() : void
    {
        if ($this->pohled)
        {
            extract($this->osetri($this->data));
            require("pohledy/" . $this->pohled . ".phtml");
        }
    }
    /** 
     *fukce presmeruje na zadanou url
     */ 
    public function presmeruj(string $url) : never
    {
        header("Location: /$url");
        header("Connection: close");
        exit;
    }
    /**
     * funkce pro oštření dat proti XSS
     */

    private function osetri($x = null)
    {
        if (!isset($x))
            return null;
        elseif (is_string($x))
            return htmlspecialchars($x, ENT_QUOTES);
        elseif (is_array($x))
        {
            foreach($x as $k => $v)
            {
                $x[$k] = $this->osetri($v);
            }
            return $x;
        }
        else
            return $x;
    }
    /**
     * funkce pro přidání zprávy do zásobníku
     */
    public function pridejZpravu(string $zprava) : void
    {
        if (isset($_SESSION['zpravy']))
            $_SESSION['zpravy'][] = $zprava;
        else
            $_SESSION['zpravy'] = array($zprava);
    }
    /**
     * vypsání zpráv ze zásobníku
     */
    public function vratZpravy() : array
    {
        if (isset($_SESSION['zpravy']))
        {
            $zpravy = $_SESSION['zpravy'];
            unset($_SESSION['zpravy']);
            return $zpravy;
        }
        else
            return array();
    }
}